# Microsoft Foundry Model Gateway

## Deployment Instructions

Deploy the infra as code using Terraform:

```bash
terraform init
```

```bash
export ARM_SUBSCRIPTION_ID=$(az account show --query id -o tsv) 
```

```bash
terraform plan -out plan.out
```

```bash
terraform apply plan.out
```

## Connect to the Bastion host

Find the credentials in the `bastion.tf` file and connect using the RDP option.

## Play with the Python sample code

Inside your Bastion, in VS Code clone this repository and go to the `catalog/ai-scenarios/ms-foundry/ms-foundry-model-gateway/src` folder.

Create your Python virtual environment and install the requirements:

```bash
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

Run the sample code:

To simulate a user request:

```bash
python main.py
```

To create an agent inside the Foundry Project that calls the APIM endpoint with the Foundry model behind:

```bash
python agent_main.py
```
