variable "region" {
  description = "The region to your ec2 instance"
}

variable "availability_zone" {
  description = "Availability zone of 'a'"
}

variable "instance_type" {
  description = "type of the instance"
}

variable "linux_ami" {
  description = "ec2 ami from linux machine"
}

variable "vpc_cidr" {
  description = "custom vpc cidr range"
}

variable "sub1_cidr" {
  description = "cidr block of subnet 1"
}
