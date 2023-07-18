# Create NAT Gateway 1 in Public Subnet 1
# terraform aws create nat gateway
# resource "aws_nat_gateway" "nat-gateway-1" {
#   allocation_id = aws_eip.eip-for-nat-gateway-1.id
#   subnet_id     = aws_subnet.public-subnet-1.id
#   tags = {
#     Name        = "Proteus GraphQL API NAT Gateway 1"
#     Application = "Proteus"
#     Project     = "Proteus GraphQL API"
#     Tier        = "Backend"
#   }
# }

# Create NAT Gateway 2 in Public Subnet 2
# terraform aws create nat gateway
# resource "aws_nat_gateway" "nat-gateway-2" {
#   allocation_id = aws_eip.eip-for-nat-gateway-2.id
#   subnet_id     = aws_subnet.public-subnet-2.id
#   tags = {
#     Name        = "Proteus GraphQL API NAT Gateway 2"
#     Application = "Proteus"
#     Project     = "Proteus GraphQL API"
#     Tier        = "Backend"
#   }
# }
