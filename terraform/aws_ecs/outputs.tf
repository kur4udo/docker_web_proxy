# Repository URLs

output "repository_urls" {
    value = "${aws_ecr_repository.ecr_repo.*.repository_url}"
}