provider "aws" {
  region = "us-east-1"

}

variable "ami" {
  description = "AMI of the demo instance"
}

variable "instance_type" {
  description = "instance type of the demo instance"
}
resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
}
