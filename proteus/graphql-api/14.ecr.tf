# Create ECR Repository
# terraform aws create ecr repository
resource "aws_ecr_repository" "graphql_api" {
  name = "graphql_api"
}
