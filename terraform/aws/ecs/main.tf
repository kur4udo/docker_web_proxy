## Providers

provider "aws" {
  region = "${var.region}"
}

## ECS Cluster

resource "aws_ecs_cluster" "ecs_cluster" {
    name = "spring-boot-cluster"
}