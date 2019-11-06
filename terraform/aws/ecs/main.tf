## Providers

provider "aws" {
  region = "${var.region}"
}

## ECS Cluster

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "spring-boot-cluster" # Needs to be included in /docker_web_proxy/terraform/aws/ecs/instance/server_init.tpl file.
}

## ECS Task Definition

module "task_definition" {
  source         = "./task_definition"
  role_arn       = "${var.role_arn}"
  family         = "${var.family}"
  cpu_amount     = "${var.cpu_amount}"
  image_name     = "${var.image_name}"
  memory_amount  = "${var.memory_amount}"
  container_port = "${var.container_port}"
  host_port      = "${var.host_port}"
}

## ECS Service

module "service_definition" {
  source          = "./service_definition"
  cluster         = "${aws_ecs_cluster.ecs_cluster.arn}" #arn:aws:ecs:eu-west-1:046752819625:cluster/spring-boot-cluster"
  desired_count   = "${var.desired_count}"
  launch_type     = "${var.launch_type}"
  name            = "${var.name}"
  task_definition = "${var.task_definition}"
}

## ECS Instances

module "instance" {
  source        = "./instance"
  ecs_ami       = "${var.ecs_ami}"
  instance_type = "${var.instance_type}"
  allowed_ports = "${var.host_port}"
}