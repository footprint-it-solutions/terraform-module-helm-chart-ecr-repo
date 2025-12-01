# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository
resource "aws_ecr_repository" "repos" {
  for_each = var.repo_names

  name = each.value

  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false # Not needed for Helm charts
  }
}
