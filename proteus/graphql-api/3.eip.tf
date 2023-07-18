# Allocate Elastic IP Address (EIP 1)
# terraform aws allocate elastic ip
resource "aws_eip" "eip-for-nat-gateway-1" {
  domain = "vpc"
  tags = {
    Name        = "Proteus GraphQL API EIP 1"
    Application = "Proteus"
    Project     = "Proteus GraphQL API"
    Tier        = "Backend"
  }
}

# Allocate Elastic IP Address (EIP 2)
# terraform aws allocate elastic ip
resource "aws_eip" "eip-for-nat-gateway-2" {
  domain = "vpc"
  tags = {
    Name        = "Proteus GraphQL API EIP 2"
    Application = "Proteus"
    Project     = "Proteus GraphQL API"
    Tier        = "Backend"
  }
}
