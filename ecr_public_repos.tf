
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecrpublic_repository
resource "aws_ecrpublic_repository" "repos" {
  for_each = var.repo_names

  repository_name = each.value

  catalog_data {
    about_text = "ECR Public repository for ${each.value}"
    architectures = [
      "ARM64",
      "X86_64",
    ]
    operating_systems = [
      "Linux",
    ]
  }
  region = "us-east-1" # ECR Public repositories are only supported in us-east-1
}
