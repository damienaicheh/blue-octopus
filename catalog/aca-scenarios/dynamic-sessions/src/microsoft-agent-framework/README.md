# Agent Sample to use Dynamic Session

## Setup

```bash
cp .env.template .env
uv sync
uv run python main.py
```

The script creates a new prompt-agent version in your Foundry project, then runs
the agent once against an example prompt that exercises the Dynamic Sessions
`Python_REPL` tool and prints the final answer.

## Environment variables

- `FOUNDRY_PROJECT_ENDPOINT`: Foundry project endpoint
- `MODEL_DEPLOYMENT_NAME`: model deployment name to use
- `PYTHON_POOL_MANAGEMENT_ENDPOINT`: endpoint to manage the Python session pool

## Example prompts to try

Change `EXAMPLE_PROMPT` in [main.py](main.py) (or extend `main()` to loop over
inputs) to test the tool. A few ideas:

**Python tool (`Python_REPL`)**
- "Compute the 20th Fibonacci number and the mean of [4, 8, 15, 16, 23, 42]."
- "Generate 1000 samples from a normal distribution with numpy and print the
  mean and standard deviation."
- "Build a small pandas DataFrame of three products with prices and return the
  total price."

## Notes

- The pool is a **code-interpreter** session pool, which exposes a Python
  execution endpoint.
- The sandbox filesystem resets per session; write shared files under
  `/mnt/data`.

