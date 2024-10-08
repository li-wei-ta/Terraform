provider "aws" {
  region = "ca-central-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0d9c7bbbda4b78ffd"
  instance_type = "t2.micro"
}
