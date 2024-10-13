terraform {
  backend "s3" {
    bucket         = "david-s3-my-bucket"
    key            = "statefile/terraform.tfstate"
    region         = "ca-central-1"
    encrypt        = true
    dynamodb_table = "terraform_lock"
  }
}
