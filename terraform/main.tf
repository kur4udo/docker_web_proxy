provider "aws" {
  region = "${var.region}"
}

## Data

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

## VPC

resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}

## Security group

resource "aws_security_group" "sg" {
  name        = "Docker machine security group"
  description = "Security group for Docker machine"
  vpc_id      = "${aws_default_vpc.default_vpc.id}"

  ingress {

    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {

    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {

    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

## EC2

resource "aws_instance" "ubuntu_server" {
  #ami           = "${data.aws_ami.ubuntu.id}"
  ami           = "ami-02df9ea15c1778c9c"
  instance_type = "${var.instance_type}"

  vpc_security_group_ids = ["${aws_security_group.sg.id}"]

  tags = {
    Name = "Docker HAProxy Spring Boot Web"
  }
}