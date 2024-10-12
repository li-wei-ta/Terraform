provider "aws" {
  region = var.region
}
resource "aws_instance" "example" {
  ami           = var.linux_ami
  instance_type = var.instance_type
}
