## Global

variable region {

  description = "Name of AWS region:"

}

## ECS Tasks

variable role_arn {

  description = "Role used for ECS tasks and services"

}

variable family {

  description = "Family name for ECS task"
  type        = "list"

}

variable cpu_amount {

  description = "Number of CPUs for this task"

}
variable memory_amount {

  description = "Amount of memory for this task"

}
variable image_name {

  description = "Image to be used"
  type        = "list"

}
variable container_port {

  description = "Container port"
  type        = "list"

}
variable host_port {

  description = "Host port"
  type        = "list"

}

## ECS Services

variable desired_count {

  description = "Number of instances for task"
  type        = "list"

}

variable launch_type {

  description = "Launch type: EC2 of FARGATE"
  default     = "EC2"

}

variable name {

  description = "Name of the service"
  type        = "list"

}

variable task_definition {

  description = "Task to be run by the service"
  type        = "list"

}

## ECS instances

variable ecs_ami {

  description = "Dedicated AMI ID fot ECS"

}

variable instance_type {

  description = "ECS instance type"

}