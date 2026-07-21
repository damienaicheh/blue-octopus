"""Create a Foundry prompt agent and run it against Dynamic Sessions tools."""

from __future__ import annotations

import asyncio
import json
import os
import urllib.request
from datetime import datetime, timezone

from agent_framework import Agent, tool
from agent_framework.foundry import FoundryChatClient
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import PromptAgentDefinition
from azure.identity import DefaultAzureCredential
from dotenv import load_dotenv
from microsoft_agent_framework_dynamic_sessions import DynamicSessionsPythonTool

load_dotenv()

INSTRUCTIONS = (
    "You are a code-execution assistant that answers questions by ACTUALLY running "
    "code inside a secure Azure Container Apps Dynamic Session sandbox.\n"
    "\n"
    "You have two tools:\n"
    "- `fetch_stock_closes`: fetch recent daily closing prices for a stock ticker "
    "from Yahoo Finance. The sandbox has NO internet access, so this is the ONLY "
    "way to obtain market data. Call it first to get the data when necessary.\n"
    "- `Python_REPL`: run Python code in the sandbox for calculations, data "
    "analysis, and generating results (charts, images, files).\n"
    "\n"
    "Hard rules (MUST follow):\n"
    "- To get market data, you MUST call `fetch_stock_closes`. NEVER try to "
    "download data from inside `Python_REPL` (the sandbox is offline).\n"
    "- You MUST call `Python_REPL` to run the plotting/analysis code yourself. "
    "NEVER answer with a code block for the user to run, and NEVER describe code "
    "without executing it.\n"
    "- NEVER ask the user to run anything, paste data, or upload a file.\n"
    "- When asked to produce a chart/diagram/image, you MUST run the code that "
    "generates it and SAVES it as a file under `/mnt/data` (e.g. "
    "`plt.savefig('/mnt/data/chart.png')`). Confirm the saved file path in your "
    "answer.\n"
    "- After you save ANY file under `/mnt/data`, you MUST immediately call the "
    "`download_file` tool with that exact file name to copy it to the local "
    "output folder. This is REQUIRED for every generated file — the task is NOT "
    "complete until the file has been downloaded. Report the `local_path` "
    "returned by the tool in your final answer.\n"
    "- If a piece of code fails, fix it and run it again until it succeeds. Only "
    "report a real result you obtained from executing code.\n"
    "\n"
    "Guidelines:\n"
    "- Keep code snippets minimal and print the values you need so the result is "
    "visible in stdout.\n"
    "- After running the tool, give a short, clear answer based on the actual "
    "output, and mention the saved file path when you created one."
    "- If an image file is generated, download it using the `download_file` tool to "
    "save it into the local output folder and view it, and mention the returned "
    "local path in your answer."
)

# The stock ticker to chart. Change this to analyze a different company (AAPL,
# GOOGL, TSLA, ...). It is passed to the agent, which calls the fetch tool itself.
TICKER = "MSFT"

SAMPLE_PROMPT = (
    f"Get the last month of daily closing prices for the {TICKER} stock, build a "
    "line chart of those closing prices over time, and save the diagram as a PNG "
    "file under /mnt/data. Then briefly summarize the trend (e.g. lowest and "
    "highest closing price) based on the chart you generated."
)


@tool(
    name="fetch_stock_closes",
    description=(
        "Fetch recent daily closing prices for a stock ticker (e.g. MSFT, AAPL, "
        "GOOGL) from Yahoo Finance. Returns CSV text with columns 'date,close'. "
        "Runs on the host (which has internet), so use it to obtain market data "
        "before charting."
    ),
)
def fetch_stock_closes(
    ticker: str, time_range: str = "1mo", interval: str = "1d"
) -> str:
    """Return daily (date, close) rows for a ticker as CSV text.

    Args:
        ticker: Stock symbol, e.g. "MSFT" or "AAPL".
        time_range: Yahoo Finance range, e.g. "5d", "1mo", "3mo", "1y".
        interval: Sampling interval, e.g. "1d", "1wk", "1mo".
    """
    url = (
        f"https://query1.finance.yahoo.com/v8/finance/chart/{ticker}"
        f"?range={time_range}&interval={interval}"
    )
    request = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
    with urllib.request.urlopen(request, timeout=20) as response:
        payload = json.load(response)

    result = payload["chart"]["result"][0]
    timestamps = result["timestamp"]
    closes = result["indicators"]["quote"][0]["close"]

    lines = ["date,close"]
    for ts, close in zip(timestamps, closes):
        if close is None:
            continue
        day = datetime.fromtimestamp(ts, tz=timezone.utc).strftime("%Y-%m-%d")
        lines.append(f"{day},{close:.2f}")
    return "\n".join(lines)


async def main() -> None:
    credential = DefaultAzureCredential()
    project_endpoint = os.environ["FOUNDRY_PROJECT_ENDPOINT"].rstrip("/")
    model_name = os.environ["MODEL_DEPLOYMENT_NAME"]
    python_pool_management_endpoint = os.environ["PYTHON_POOL_MANAGEMENT_ENDPOINT"]

    project = AIProjectClient(endpoint=project_endpoint, credential=credential)
    code_agent_executor = project.agents.create_version(
        agent_name="execute-code-tool-agent-maf",
        definition=PromptAgentDefinition(
            model=model_name,
            instructions=INSTRUCTIONS,
        ),
    )

    python_dynamic_sessions_python_tool = DynamicSessionsPythonTool(
        pool_management_endpoint=python_pool_management_endpoint,
        output_directory=os.path.join(os.path.dirname(__file__), "output"),
    )

    agent = Agent(
        client=FoundryChatClient(
            project_endpoint=project_endpoint,
            model=model_name,
            credential=credential,
        ),
        name=code_agent_executor.name,
        tools=[
            fetch_stock_closes,
            python_dynamic_sessions_python_tool.python_repl,
            python_dynamic_sessions_python_tool.list_files,
            python_dynamic_sessions_python_tool.download_file,
        ],
    )

    print(f"User: {SAMPLE_PROMPT}\n")
    response = await agent.run(SAMPLE_PROMPT)
    print(f"Agent: {response.text}")


if __name__ == "__main__":
    asyncio.run(main())
