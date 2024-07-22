# Blue Octopus

![Logo](docs/logo.jpg)

## Deploy

```bash
cd terraform && terraform init
```

Update the `env.tfvars.tpl` and rename it `env.tfvars`. Run the plan:

```bash
terraform plan -out plan.out -var-file env.tfvars
```

Then apply the changes:

```bash
terraform apply plan.out
```