provider "aws" {
  region = "ca-central-1"
}

provider "vault" {
  address          = "99.79.192.64:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = "<>"
      secret_id = "<>"
    }
  }
}


data "vault_kv_secret_v2" "name" {
  mount = "kv"
  name  = "test-secret"
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0eb9fdcf0d07bd5ef"
  instance_type = "t2.micro"
  tags = {
    Name   = "test"
    Secret = data.vault_kv_secret_v2.example.data["username"]
  }
}
