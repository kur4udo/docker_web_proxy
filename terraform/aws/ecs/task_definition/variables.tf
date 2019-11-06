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
