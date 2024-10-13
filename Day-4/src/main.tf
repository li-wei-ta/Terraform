provider "aws" {
  region = "ca-central-1"
}

# resource "aws_instance" "davids_instance" {
#   instance_type = "t2.micro"
#   ami           = "ami-0eb9fdcf0d07bd5ef"
# }

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "david-s3-my-bucket"
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
