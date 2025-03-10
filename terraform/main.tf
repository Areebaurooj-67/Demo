terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # Hardcoded AWS region
}

# Security Group for the Bastion Host
resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg"
  description = "Allow SSH access to bastion host"
  vpc_id      = "vpc-12345678" # Hardcoded VPC ID

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Change this to your IP for security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-sg"
  }
}

# EC2 Instance for Bastion Host
resource "aws_instance" "bastion" {
  ami                    = "ami-0abcdef1234567890" 
  instance_type          = "t3.micro" 
  subnet_id              = "subnet-34983345" 
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  key_name               = "my-ssh-key" 

  tags = {
    Name = "Bastion-Host"
  }
}
