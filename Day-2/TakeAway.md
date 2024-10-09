# Key Take Away

## Providers

- Basically a cloud provider plugin to allow us to interact with it's cloud API, e.g. AWS, Azure, GCP, Oracle, etc
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
