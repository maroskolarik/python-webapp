terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.39.1"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "ec2" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  key_name                    = "aws-ec2-ubuntu"
  subnet_id                   = aws_subnet.aws-public-subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  user_data                   = file("./scripts/install-dependencies.sh")
  tags = {
    Name = var.instance_name
  }
}
