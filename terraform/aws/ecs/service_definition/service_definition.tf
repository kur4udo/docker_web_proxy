## ECS Service

resource "aws_ecs_service" "ecs_service" {
  count           = "${length(var.name)}"
  cluster         = "${var.cluster}"
  desired_count   = "${var.desired_count[count.index]}"
  launch_type     = "${var.launch_type}"
  name            = "${var.name[count.index]}"
  task_definition = "${var.task_definition[count.index]}"
}