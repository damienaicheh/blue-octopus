# Blue Octopus

![Logo](docs/logo.jpg)

## Disclaimer

This sample scripts are not supported under any Microsoft standard support program or service. The sample script is provided AS IS without warranty of any kind. Microsoft further disclaims all implied warranties including, without limitation, any implied warranties of merchantability or of fitness for a particular purpose. The entire risk arising out of the use or performance of the sample scripts and documentation remains with you. In no event shall Microsoft, its authors, or anyone else involved in the creation, production, or delivery of the scripts be liable for any damages whatsoever (including, without limitation, damages for loss of business profits, business interruption, loss of business information, or other pecuniary loss) arising out of the use of or inability to use the sample scripts or documentation, even if Microsoft has been advised of the possibility of such damages.

## Deploy

```bash
cd terraform && terraform init
```

```bash
export ARM_SUBSCRIPTION_ID=$(az account show --query id -o tsv)
```

Update the `env.tfvars.tpl` and rename it `env.tfvars`. Run the plan:

```bash
terraform plan -out plan.out -var-file env.tfvars
```

Then apply the changes:

```bash
terraform apply plan.out
```

## Runing the scripts

```bash
# Activate the virtual environment
python -m venv .venv

# For Linux and macOS
source .venv/bin/activate 

# For Windows
.\.venv\Scripts\activate

# Install the required packages
pip install -r requirements.txt
python main.py
```