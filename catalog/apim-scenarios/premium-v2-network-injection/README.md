# AI Foundry - Private Network Standard Agent Setup with User Assigned Identity (Terraform)

This Terraform configuration is an exact translation of the Bicep template `17-private-network-standard-user-assigned-identity-agent-setup` from the Azure AI Foundry samples.

## Architecture

This configuration deploys an Azure AI Foundry Standard Agent with:
- **User Assigned Managed Identity** for authentication (not System Assigned)
- **End-to-end network isolation** using private endpoints
- **BYO (Bring Your Own) resources**: Storage Account, Cosmos DB, and AI Search

### Resources Created

| Resource | Name Pattern | Description |
|----------|--------------|-------------|
| Resource Group | `rg-{suffix}` | Contains all resources |
| User Assigned Identity | `id-{suffix}` | UAI for AI Foundry authentication |
| Virtual Network | `vnet-{suffix}` | VNet with 2 subnets |
| Subnet (Hosts/Agents) | `HostsAgentSubnet` | Delegated subnet for Container Apps |
| Subnet (PaaS) | `PaasSubnet` | Subnet for private endpoints |
| Storage Account | `st{suffix_no_hyphen}` | Blob storage for agent files |
| Cosmos DB Account | `cosmos-{suffix}` | Thread storage for agents |
| AI Search | `srch-{suffix}` | Vector store for agents |
| AI Foundry Account | `aif-{suffix}` | AI Services with project management |
| AI Foundry Project | `prj-{suffix}` | Project with capability host |
| Capability Host | `prj-cap-host-{suffix}` | Agents capability host |
| Model Deployment | `gpt-4o` | GPT-4o model deployment |
| Private DNS Zones | `privatelink.*` | DNS zones for private endpoints |
| Private Endpoints | `pe-*-{suffix}` | Private endpoints for all services |

### Network Security

All services are deployed with:
- Public network access disabled
- Private endpoints in `PaasSubnet`
- Private DNS zones linked to VNet
- VNet injection for Standard Agents in `HostsAgentSubnet`

## Prerequisites

- Azure CLI authenticated (`az login`)
- Terraform >= 1.0
- Required provider versions:
  - azurerm = 4.57.0
  - azapi = 2.8.0
  - random = 3.6.3

## Usage

### Initialize

```bash
terraform init
```

### Plan

```bash
terraform plan -out=tfplan
```

### Deploy

```bash
terraform apply tfplan
```

### Customize Variables

Create a `terraform.tfvars` file:

```hcl
domain      = "prv"
workload    = "agt"
environment = "dev"
location    = "eastus2"
region      = "eus2"

vnet_address_prefix                = "10.10"
vnet_address_suffix                = ".0.0/16"
hosts_agent_subnet_address_suffix  = ".0.0/24"
paas_subnet_address_suffix         = ".1.0/24"

model_name     = "gpt-4o"
model_format   = "OpenAI"
model_version  = "2024-11-20"
model_sku_name = "GlobalStandard"
model_capacity = 1

tags = {
  Owner = "your-name"
}
```

## Key Differences from System Assigned Identity

This configuration uses **User Assigned Identity** instead of System Assigned Identity:

1. **UAI Resource**: Creates an `azurerm_user_assigned_identity` resource
2. **AI Foundry Identity**: Uses `identity.type = "UserAssigned"` with the UAI reference
3. **AI Project Identity**: Uses `identity.type = "UserAssigned"` with the UAI reference
4. **Role Assignments**: All role assignments use the UAI's `principal_id`

## Files Structure

```
17-private-network-standard-uai-agent-setup-tf/
├── providers.tf          # Provider configuration (azurerm, azapi, random)
├── variables.tf          # Input variables
├── locals.tf             # Local values and naming conventions
├── data.tf               # Data sources
├── randomize.tf          # Random suffix generation
├── rg.tf                 # Resource Group
├── identity.tf           # User Assigned Managed Identity
├── vnet.tf               # Virtual Network
├── subnets.tf            # Subnets with delegation
├── sto.tf                # Storage Account + Connection
├── cosmos_db.tf          # Cosmos DB Account + Connection
├── ai_search.tf          # AI Search Service + Connection
├── dns_zone.tf           # Private DNS Zones
├── dns_link.tf           # DNS Zone VNet Links
├── pe.tf                 # Private Endpoints
├── ms_foundry.tf         # AI Foundry Account + Model Deployment
├── ms_foundry_project.tf # AI Project + Capability Host
└── roles.tf              # Role Assignments (RBAC + Cosmos SQL)
```

## API Versions Used

| Service | API Version |
|---------|-------------|
| AI Foundry Account | `Microsoft.CognitiveServices/accounts@2025-06-01` |
| AI Foundry Project | `Microsoft.CognitiveServices/accounts/projects@2025-06-01` |
| Capability Host | `Microsoft.CognitiveServices/accounts/projects/capabilityHosts@2025-04-01-preview` |
| Connections | `Microsoft.CognitiveServices/accounts/projects/connections@2025-06-01` |
| AI Search | `Microsoft.Search/searchServices@2025-05-01` |
