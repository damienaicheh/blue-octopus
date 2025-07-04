import requests, time
import random
import dotenv
dotenv.load_dotenv()
import os
import json

RESET_FORMATTING = "\x1b[0m"
BOLD_RED = "\x1b[1;31m"
BOLD_GREEN = "\x1b[1;32m"

apim_resource_gateway_url = os.environ["APIM_RESOURCE_GATEWAY_URL"]
openai_model_name = os.environ.get("OPENAI_MODEL_NAME", "gpt-4o")
openai_api_version = os.environ.get("OPENAI_API_VERSION", "2024-02-01")
apim_subscription1_key = os.environ["APIM_SUBSCRIPTION_1_KEY"]
apim_subscription2_key = os.environ["APIM_SUBSCRIPTIO_2_KEY"]
apim_subscription3_key = os.environ["APIM_SUBSCRIPTIO_3_KEY"]

runs = 50
sleep_time_ms = 100
url = f"{apim_resource_gateway_url}/openai/deployments/{openai_model_name}/chat/completions?api-version={openai_api_version}"
messages = {"messages": [
    {"role": "system", "content": "You are a sarcastic, unhelpful assistant."},
    {"role": "user", "content": "Can you tell me the time, please?"}
]}
api_runs = []

def print_response_code(response):
    # Check the response status code and apply formatting
    if 200 <= response.status_code < 300:
        status_code_str = f"{BOLD_GREEN}{response.status_code} - {response.reason}{RESET_FORMATTING}"
    elif response.status_code >= 400:
        status_code_str = f"{BOLD_RED}{response.status_code} - {response.reason}{RESET_FORMATTING}"
    else:
        status_code_str = str(response.status_code)

    # Print the response status with the appropriate formatting
    print(f"Response status: {status_code_str}")

def random_subscription_key() -> dict[str, str]:
    """Randomly select a subscription key from the available ones."""
    keys = {
        "APIM_SUBSCRIPTION_1_KEY": apim_subscription1_key,
        "APIM_SUBSCRIPTION_2_KEY": apim_subscription2_key,
        "APIM_SUBSCRIPTION_3_KEY": apim_subscription3_key
    }
    name, value = random.choice(list(keys.items()))
    return {name: value}


session = requests.Session()

try:
    for i in range(runs):
        print(f"▶️ Run {i+1}/{runs}:")
        subscription_key = random_subscription_key()
        (key_name, key_value), = subscription_key.items()
        print(f"🔑 Using subscription key: {key_name}")
        session.headers.update({'api-key': key_value})

        start_time = time.time()
        response = session.post(url, json = messages)
        response_time = time.time() - start_time
        print(f"⌚ {response_time:.2f} seconds")

        print_response_code(response)

        if "x-ms-region" in response.headers:
            print(f"x-ms-region: \x1b[1;32m{response.headers.get('x-ms-region')}\x1b[0m") # this header is useful to determine the region of the backend that served the request
            api_runs.append((response_time, response.headers.get("x-ms-region")))

        if (response.status_code == 200):
            data = json.loads(response.text)
            print(f"Token usage: {json.dumps(dict(data.get('usage')), indent = 4)}\n")
            print(f"💬 {data.get('choices')[0].get('message').get('content')}\n")
        else:
            print(f"{response.text}\n")

        time.sleep(sleep_time_ms/1000)
finally:
    # Close the session to release the connection
    session.close()

