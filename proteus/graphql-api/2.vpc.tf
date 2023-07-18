# Create VPC
# terraform aws create vpc
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc-cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name        = "Proteus GraphQL API VPC"
    Application = "Proteus"
    Project     = "Proteus GraphQL API"
    Tier        = "Backend"
  }
}
