## Providers

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

data "template_file" "server_init" {
  template = "${file("server_init.tpl")}"
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

    from_port   = 22
    to_port     = 22
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

  tags = {
    Name = "Docker HAProxy Spring Boot Web Security Group"
  }
}

## EC2

resource "aws_instance" "ubuntu_server" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.instance_type}"

  vpc_security_group_ids = ["${aws_security_group.sg.id}"]

  key_name = "${aws_key_pair.ec2_key.id}"

  user_data = "${base64encode(data.template_file.server_init.rendered)}"

  tags = {
    Name = "Docker HAProxy Spring Boot Web EC2"
  }
}

## Public key

resource "aws_key_pair" "ec2_key" {
  public_key = "${var.public_key}"
}