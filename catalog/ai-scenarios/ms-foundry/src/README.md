# Microsoft Foundry — Hosted Agents (writer workflow)

This folder contains two **hosted agent** examples that implement the same
human‑in‑the‑loop "LinkedIn writer" workflow (`ideator → writer → human review →
proofreader`) and run **inside a Microsoft Foundry project**:

The end‑to‑end flow is always the same:

1. **Provision a Foundry project** (either `basic` or `private-network`).
2. **Create the Foundry toolbox** (the tools the writer uses).
3. **Deploy one or both hosted agents.**

| Folder | Agent | Framework |
|--------|-------|-----------|
| [`starter-scripts/`](./starter-scripts) | — | Toolbox + deploy scripts |
| [`microsoft-agent-framework/`](./microsoft-agent-framework) | `writer-workflow-maf` | Microsoft Agent Framework |
| [`langgraph-agents/`](./langgraph-agents) | `writer-workflow-lg` | LangChain / LangGraph |

---

## Prerequisites

Use the Dev Container from this repository to automatically get the right setup of:
- Azure CLI, Python, uv, jq.

---

## Step 1 — Provision a Foundry project

Deploy **one** of the two Terraform stacks (they live one level up, next to this
`src/` folder):

| Option | Path | When to use |
|--------|------|-------------|
| **Basic** | [`../basic`](../basic) | Public Foundry project — simplest, fastest to test. |
| **Private network** | [`../private-network`](../private-network) | private endpoints, public access disabled (production‑like isolation). |

```bash
cd ../basic          # or: cd ../private-network
terraform init
terraform plan -out=tfplan
terraform apply tfplan
```

After `apply`, note the two values you will reuse below (from the Azure portal or
the Terraform state/outputs):

- the **Foundry project endpoint** —
  `https://<account>.services.ai.azure.com/api/projects/<project>`
- the **Azure Container Registry (ACR) name** — e.g. `acrdevswcaifdy786a`

---

## Step 2 — Configure the environment

From this `src/` folder, create your `.env` from the template and fill it in:

```bash
cp .env.template .env
# edit .env and set at least:
#   FOUNDRY_PROJECT_ENDPOINT=https://<account>.services.ai.azure.com/api/projects/<project>
```

---

## Step 3 — Create the Foundry toolbox (one‑time)

This registers the toolbox the writer grounds its posts with (Microsoft Learn MCP
+ Web Search) and makes it the default version:

```bash
cd starter-scripts
uv sync
uv run python create_toolbox.py
```

> The script reads `FOUNDRY_PROJECT_ENDPOINT` and `TOOLBOX_NAME` from the `.env`
> you created in Step 2.

If you use the private network stack, you must temporarily enable public access on the Foundry account or run this script inside the same private network (VNet) as the Foundry project.

---

## Step 4 — Deploy a hosted agent

Run the wrapper for the example you want. Both take the **ACR name** and the
**Foundry project endpoint** as arguments:

```bash
cd ../starter_scripts

# Microsoft Agent Framework agent (writer-workflow-maf)
./deploy_microsoft_agent_framework.sh <acr-name> <foundry-project-endpoint>

# LangChain / LangGraph agent (writer-workflow-lg)
./deploy_langgraph_agents.sh <acr-name> <foundry-project-endpoint>
```

Each script:

1. builds and pushes the agent image to ACR (`az acr build`),
2. creates the hosted agent (first run) or adds a new version (subsequent runs),
3. grants the agent's managed identity the **Foundry User** role so the container
   can create its agent versions at startup.

Optional overrides (defaults in parentheses): `MODEL_DEPLOYMENT_NAME` (`gpt-5.4`),
`TOOLBOX_NAME` (`linkedin-writer-tools`) — export them before running the script.

---

## Private network: temporary public access during deployment

When you use the **`private-network`** stack, the Foundry account **and** the ACR
have **public network access disabled**. From a machine outside the VNet (for
example this dev container), Steps 3 and 4 can't reach them — the toolbox call and
the `az acr build` / agent creation will fail.

The workflow is: **temporarily open public access on both resources**, run
Steps 3–4, then **close them again**. Once the resources are private again, the
hosted agent still shows up in the Foundry portal and can be used from the
**playground** (which runs inside the platform / VNet).

You can do it easily in the Azure portal inside the Network tab of each resource.

---

## Step 5 — Try it

In the Foundry portal, open **Agents → `writer-workflow-maf`** (or
`writer-workflow-lg`) and start a run in the **playground**:

1. Submit a topic (e.g. *"Deploying containers on Azure"*).
2. The workflow pauses and returns a `request_info` item asking a human to review
   the draft.
3. Reply `approve` to accept it, or a short note to send it back to the writer for
   a revision.

For local testing of the Microsoft Agent Framework agent, see
[`microsoft_agent_framework/demo.http`](./microsoft_agent_framework/demo.http).
