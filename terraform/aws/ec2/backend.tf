## Backend

terraform {
  backend "s3" {
    bucket = "tg-terraform-states"
    key    = "docker_web_proxy/aws_ec2/terraform.tfstate"
    region = "eu-west-1"
  }
}