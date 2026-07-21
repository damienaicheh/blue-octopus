from __future__ import annotations

import os

from azure.identity import DefaultAzureCredential
from dotenv import load_dotenv
from langchain_azure_ai.agents import AgentServiceFactory
from langchain_core.messages import HumanMessage
from tools import DynamicSessionsToolset

load_dotenv()

OUTPUT_DIRECTORY = os.path.join(os.path.dirname(__file__), "output")


INSTRUCTIONS = """
    You are a code-execution assistant that answers questions by ACTUALLY running 
    code inside a secure Azure Container Apps Dynamic Session sandbox.
    
    You have 4 tools:
    - `fetch_stock_closes`: fetch recent daily closing prices for a stock ticker 
    from Yahoo Finance. The sandbox has NO internet access, so this is the ONLY 
    way to obtain market data. Call it first to get the data when necessary.
    - `Python_REPL`: run Python code in the sandbox for calculations, data 
    analysis, and generating results (charts, images, files).
    - `List_Session_Files`: list files in the sandbox's `/mnt/data` directory. Use 
    it to check which files have been created by your code.
    - `Download_Session_File`: copy a file from the sandbox's `/mnt/data` directory 
    to the local output folder. Use it to retrieve any files you generated 
    (charts, images, CSVs, etc.) so the user can view them locally.
    
    Hard rules (MUST follow):
    - To get market data, you MUST call `fetch_stock_closes`. NEVER try to 
    download data from inside `Python_REPL` (the sandbox is offline).
    - You MUST call `Python_REPL` to run the plotting/analysis code yourself. 
    NEVER answer with a code block for the user to run, and NEVER describe code 
    without executing it.
    - NEVER ask the user to run anything, paste data, or upload a file.
    - When asked to produce a chart/diagram/image, you MUST run the code that 
    generates it and SAVES it as a file under `/mnt/data` (e.g. 
    `plt.savefig('/mnt/data/chart.png')`). Confirm the saved file path in your 
    answer.
    - After you save ANY file under `/mnt/data`, you MUST immediately call the 
    `Download_Session_File` tool with that exact file name to copy it to the 
    local output folder. This is REQUIRED for every generated file — the task is 
    NOT complete until the file has been downloaded. You MUST report the 
    `local_path` value returned by the tool in your final answer.
    - If a piece of code fails, fix it and run it again until it succeeds. Only 
    report a real result you obtained from executing code.
    
    Guidelines:
    - Keep code snippets minimal and print the values you need so the result is 
    visible in stdout.
    - After running the tool, give a short, clear answer based on the actual 
    output, and mention the saved file path when you created one.
    - If an image file is generated, download it using the `Download_Session_File` 
    tool to save it into the local output folder, and mention the returned 
    `local_path` in your answer.
"""

# The stock ticker to chart. Change this to analyze a different company (AAPL,
# GOOGL, TSLA, ...). It is passed to the agent, which calls the fetch tool itself.
TICKER = "MSFT"

SAMPLE_PROMPT = (
    f"Get the last month of daily closing prices for the {TICKER} stock, build a "
    "line chart of those closing prices over time, and save the diagram as a PNG "
    "file under /mnt/data. Then download that PNG file to the local output folder "
    "and give me its local_path. Finally, briefly summarize the trend (e.g. lowest "
    "and highest closing price) based on the chart you generated."
)


def main():
    project_endpoint = os.environ["FOUNDRY_PROJECT_ENDPOINT"].rstrip("/")
    deployment = os.environ["MODEL_DEPLOYMENT_NAME"]
    python_pool_management_endpoint = os.environ["PYTHON_POOL_MANAGEMENT_ENDPOINT"]

    factory = AgentServiceFactory(
        project_endpoint=project_endpoint,
        credential=DefaultAzureCredential(),
    )

    dynamic_session_tool_set = DynamicSessionsToolset(
        pool_management_endpoint=python_pool_management_endpoint,
        output_directory=OUTPUT_DIRECTORY,
    )

    execute_code_agent = factory.create_prompt_agent(
        name="execute-code-tool-agent-lc",
        model=deployment,
        instructions=INSTRUCTIONS,
        tools=[
            dynamic_session_tool_set.fetch_stock_closes,
            dynamic_session_tool_set.python_repl,
            dynamic_session_tool_set.list_files,
            dynamic_session_tool_set.download_file,
        ],
    )

    print(f"User: {SAMPLE_PROMPT}\n")
    response = execute_code_agent.invoke(
        {"messages": [HumanMessage(content=SAMPLE_PROMPT)]}
    )

    print(f"Agent: {response['messages'][-1].content}")


if __name__ == "__main__":
    main()
