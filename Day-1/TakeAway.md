# Key Take Aways

## Introduction to IaC (What's it's significance?)

- Automate infrastucture Provisioning through code instead of manual configuration
- Better version Control
- Other Popular IaC tools include -> AWS CloudFormation, Azure Resource Manager, etc

## Why Terraform as IaC?

- Multi-Cloud Support (AWS, Azure, GCP, etc) -> more universal
- Declarative Syntax
  - Idempotency -> Just focus on end state, terraform won't make any changes if you run the same configuration multiple times
  - Define "what" you want and not "how" (imperative) you want it
- State management -> Terraform has a state file that tracks the state of your infra.

## Basic commands terraform commands

- "terraform init" -> When working on a new terraform project or make any changes to backend
- "terraform plan" -> Shows what terraform is going to perform before making the changes
- "terraform apply" -> Actually apply the changes to match your desired configuration
- "terraform destroy" -> Remove everything managed by terraform

## Hands on learning

- Provisioned a simple ec2 instance in main.tf
