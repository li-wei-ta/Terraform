

module "ec2_instance" {
  source        = "./module/ec2_instance"
  region        = "ca-central-1"
  instance_type = "t2.micro"
  linux_ami     = "ami-0eb9fdcf0d07bd5ef"
}
