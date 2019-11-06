## ECS Task Definition

resource "aws_ecs_task_definition" "task_definition" {
  count = "${length(var.image_name)}"

  execution_role_arn = "${var.role_arn}"
  family             = "${var.family[count.index]}"
  task_role_arn      = "${var.role_arn}"

  requires_compatibilities = [
    "EC2",
  ]

  container_definitions = jsonencode(
    [
      {
        cpu       = "${var.cpu_amount}"
        essential = true
        image     = "${var.image_name[count.index]}"
        memory    = "${var.memory_amount}"
        name      = "${var.family[count.index]}"
        portMappings = [
          {
            containerPort = "${var.container_port[count.index]}"
            hostPort      = "${var.host_port[count.index]}"
            protocol      = "tcp"
          },
        ]
      },
    ]
  )
}