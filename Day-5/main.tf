provider "aws" {
  region = var.region
}

resource "aws_key_pair" "example" {
  key_name   = "demo-key-pair"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "example1" {
  ami                         = var.linux_ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet_1.id
  key_name                    = aws_key_pair.example.key_name
  vpc_security_group_ids      = [aws_security_group.ec2_security_group.id]
  associate_public_ip_address = true


  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "app.py"
    destination = "/home/ubuntu/app.py" 
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello from the remote instance'",
      "sudo apt update -y",                
      "sudo apt install -y python3-flask", 
      "cd /home/ubuntu",
      "nohup sudo python3 app.py" 
    ]
  }
}

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "subnet_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.sub1_cidr
  availability_zone = var.availability_zone
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


}
resource "aws_route_table_association" "rt_association" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "ec2_security_group" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    description = "allow ssh from all traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow http from all traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
