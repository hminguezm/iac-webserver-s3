# iac webserver s3

A [Terraform](https://www.terraform.io/docs/index.html)

# Requirements

You must have installed [Terraform](https://www.terraform.io/docs/index.html)

## Environment (secret) files

This repository comes with an **example.tfvars**. Copy these file and change the name to the name of the corresponding environment

For example: **dev.tfvars** for local development.

# Init terraform

## 1. Start Terraform

```
terraform init -backend-config=dev.tfvars
```

# Preparing and applying infrastructure changes


## 1. Run plan with environment file

* Choose an available tfvars ( dev.tfvars, qa.tfvars, production.tfvars )

```
terraform plan -var-file=**environment**.tfvars 
```

## 2. Apply plan with environment file

* Choose an available tfvars ( dev.tfvars, qa.tfvars, production.tfvars )

```
terraform apply -var-file=**environment**.tfvars 
```
