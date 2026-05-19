"""
Quick tests for Foundry Model through APIM with JWT token:
  1. SDK call (stream = False) with JWT token
  2. SDK call (stream = True) with JWT token
Environment variables required
--------------------------------
APIM_RESOURCE_GATEWAY_URL   -  https://<apim-name>.azure-api.net
FOUNDRY_API_VERSION          -  2024-05-01-preview  (default)
FOUNDRY_MODEL_NAME           -  deployment/model name (default gpt-5.4-mini)
ALL_APIS_SUBSCRIPTION_KEY    -  any valid subscription key for APIM
"""

from __future__ import annotations
import json
import requests
import os
import time
from typing import List
from dotenv import load_dotenv
from azure.identity import DefaultAzureCredential

# Load environment variables from .env file
load_dotenv()

# ────────────────────────────────────────────────────────────────────────────────
# Configuration
# ────────────────────────────────────────────────────────────────────────────────
apim_resource_gateway_url: str = os.environ["APIM_RESOURCE_GATEWAY_URL"]
foundry_model_name: str = os.getenv("FOUNDRY_MODEL_NAME", "gpt-5.4-mini")
openai_api_version: str = os.getenv("OPENAI_API_VERSION", "2024-05-01-preview")
foundry_deployment_name: str = os.getenv("FOUNDRY_DEPLOYMENT_NAME", foundry_model_name)
api_key: str = os.getenv("APIM_APIS_SUBSCRIPTION_KEY", "")


def get_jwt_token_from_current_user() -> str:
    # Initialize the DefaultAzureCredential
    credential = DefaultAzureCredential()

    # Specify the scope for the token (e.g., Azure Resource Manager)
    scope = "https://management.azure.com/.default"

    # Get the access token
    user_credential = credential.get_token(scope)

    # Print the JWT token
    print(f"🔐 JWT token retrieved: {user_credential.token[:20]}...")
    print("Access Token:", user_credential.token)
    return user_credential.token

# ────────────────────────────────────────────────────────────────────────────────
# Direct HTTP call with streaming and JWT token
# ────────────────────────────────────────────────────────────────────────────────

def test_sdk_streaming(user_input: str) -> None:
    print("\n▶️  Direct HTTP call (stream = True) with JWT token")
    print(user_input)

    # Get JWT token and create custom headers
    jwt_token = get_jwt_token_from_current_user()

    # Use the exact v2 URL format you specified
    base_url = f"{apim_resource_gateway_url}/openai"
    deployment_path = f"deployments/{foundry_deployment_name}/chat/completions"
    api_version_param = f"?api-version={openai_api_version}"

    headers = {
        "Authorization": f"Bearer {jwt_token}",
        "api-key": api_key,
        "Content-Type": "application/json"
    }

    print(f"headers: {headers}")

    payload = {
        "messages": [
            {
                "role": "system",
                "content": "You are a helpful AI assistant."
            },
            {
                "role": "user",
                "content": f'{user_input}',
            }
        ],
        "stream": True,
        "model": foundry_model_name
    }

    start = time.time()
    
    full_url = f"{base_url}/{deployment_path}{api_version_param}"
    print(f"Making POST request to: {full_url}")

    try:
        with requests.post(full_url, headers=headers, json=payload, stream=True) as response:
            print(f"📊 Status: {response.status_code}")

            if response.status_code != 200:
                print(f"❌ Error: {response.text}")
                return

            chunks: List[str] = []
            for line in response.iter_lines():
                if line:
                    chunk_time = time.time() - start
                    line_str = line.decode('utf-8')

                    if line_str.startswith('data: '):
                        data_str = line_str[6:]  # Remove 'data: ' prefix

                        if data_str.strip() == '[DONE]':
                            break

                        try:
                            data = json.loads(data_str)
                            if 'choices' in data and len(data['choices']) > 0:
                                delta = data['choices'][0].get('delta', {})
                                if 'content' in delta and delta['content']:
                                    text = delta['content']
                                    chunks.append(text)
                                    print(
                                        f"[{chunk_time:05.2f}s] {text}", end="", flush=True)
                        except json.JSONDecodeError:
                            continue

            print(f"\nFull response received in {time.time() - start:.2f}s")
            print("Full conversation received:", "".join(chunks))

    except requests.exceptions.RequestException as e:
        print(f"❌ Request failed: {str(e)}")

# ────────────────────────────────────────────────────────────────────────────────
# test
# ────────────────────────────────────────────────────────────────────────────────
if __name__ == "__main__":
    test_sdk_streaming("Count to 1000, with a comma between each number and no newlines.")