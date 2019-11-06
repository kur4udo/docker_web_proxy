## Data

data "template_file" "server_init" {
  template = "${file("./instance/server_init.tpl")}"
}

## VPC

resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}

## Security group

resource "aws_security_group" "ecs_sg" {
  name        = "ecs_sg"
  vpc_id      = "${aws_default_vpc.default_vpc.id}"

   ingress {

    from_port   = "${var.allowed_ports[0]}"
    to_port     = "${var.allowed_ports[0]}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {

    from_port   = "${var.allowed_ports[1]}"
    to_port     = "${var.allowed_ports[1]}"
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
    Name = "ECS servers security group"
  }
}

## EC2

resource "aws_instance" "ecs_server" {
  ami           = "${var.ecs_ami}"
  instance_type = "${var.instance_type}"

  vpc_security_group_ids = ["${aws_security_group.ecs_sg.id}"]

  user_data = "${base64encode(data.template_file.server_init.rendered)}"

  tags = {
    Name = "ECS server"
  }
}