# Key Take Away

## Hands on

- Configured networking infrastructure from scratch -> VPC, subnet, internet gateway, route tables and security groups
- Deployed a simple static apache website on Linux ec2 instance using userdata under 'src/user_data.sh'
- Made the website accessible from the internet

## Providers

- Basically a cloud provider plugin to allow us to interact with it's cloud API, e.g. AWS, Azure, GCP, Oracle, etc
- Usually written in "provider.tf" file
- Multi-provider/Multi Cloud "provider.tf" file e.g.

```HCL
provider "aws" {
  region = "us-east-1"
}

provider "azurerm" {
  subscription_id = "your-azure-subscription-id"
  client_id = "your-azure-client-id"
  client_secret = "your-azure-client-secret"
  tenant_id = "your-azure-tenant-id"
}
```

- Multi-region e.g.

```HCL
provider "aws" {
  alias  = "ca-central-1"
  region = "ca-central-1"
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0d9c7bbbda4b78ffd"
  instance_type = "t2.micro"
  provider      = aws.ca-central-1
}

resource "aws_instance" "example2" {
  ami           = "ami-0fff1b9a61dec8a5f"
  instance_type = "t2.micro"
  provider      = aws.us-east-1
}

```

## Variables

- Input Variable -> "Input.tf" file

  - Used to parameterize your terraform configurations
  - Defined at the root or in a different module
  - e.g.

  ```HCL
  variable "example_var" {
  description = "An example input variable" # optional
  type        = string
  default     = "default_value"
  }

  resource "example_resource" "example" {
  name = var.example_var
  # other resource configurations
  }
  ```

- Output Variable -> "output.tf" file

  - It's like a print statement for Terraform
  - Provides the information after "terraform apply" has been successful
  - e.g.

  ```HCL
  output "example_output" {
  description = "An example output variable"
  value       = resource.example_resource.example.id
  }

  # It can be accessed from another module like this as well:
  output "root_output" {
  value = module.example_module.example_output
  }
  ```

## terraform.tfvars

- A file to store your **input variables** (the actual values), instead of hardcoding directly into your terraform configuration
- Good for -> Configuration code separation, flexibility, Storing sensitive information, Reusability, Collaboration
- How to use it?
  - Create "variables.tf" for your input variables
  - Create a separate ".tfvars" file, each containing specific values for the input variables
  - When running "terraform apply" use:
  ```
  terraform apply -var-file=dev.tfvars
  ```

## conditional expressions

- conditional logic within your configuration
- syntax e.g.

```HCL
resource "aws_instance" "example" {
  count = var.create_instance ? 1 : 0

  ami           = "ami-XXXXXXXXXXXXXXXXX"
  instance_type = "t2.micro"
}
```
