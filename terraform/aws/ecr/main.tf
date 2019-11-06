## Providers

provider "aws" {
  region = "${var.region}"
}

## ECR

resource "aws_ecr_repository" "ecr_repo" {
  count = "${length(var.ecr_repo_names)}"

  name = "${var.ecr_repo_names[count.index]}"

  image_scanning_configuration {
    scan_on_push = true
  }
}
