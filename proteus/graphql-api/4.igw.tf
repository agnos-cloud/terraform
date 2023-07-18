# Create Internet Gateway and attach to VPC
# terraform aws create internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "Proteus GraphQL API IGW"
    Application = "Proteus"
    Project     = "Proteus GraphQL API"
    Tier        = "Backend"
  }
}
