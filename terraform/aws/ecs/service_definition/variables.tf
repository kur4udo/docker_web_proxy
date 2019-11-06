variable cluster {

  description = "Cluster name for service"

}

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
