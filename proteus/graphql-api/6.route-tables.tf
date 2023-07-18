# Create Public Route Table and Public Route
# terraform aws create route table
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name        = "Proteus GraphQL API Public RT"
    Application = "Proteus"
    Project     = "Proteus GraphQL API"
    Tier        = "Backend"
  }
}

# Create Private Route Table 1 and add route through NAT Gateway 1
# terraform aws create route table
# resource "aws_route_table" "private-route-table-1" {
#   vpc_id = aws_vpc.vpc.id
#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat-gateway-1.id
#   }
#   tags = {
#     Name        = "Proteus GraphQL API Private RT 1"
#     Application = "Proteus"
#     Project     = "Proteus GraphQL API"
#     Tier        = "Backend"
#   }
# }

# Create Private Route Table 2 and add route through NAT Gateway 2
# terraform aws create route table
# resource "aws_route_table" "private-route-table-2" {
#   vpc_id = aws_vpc.vpc.id
#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat-gateway-2.id
#   }
#   tags = {
#     Name        = "Proteus GraphQL API Private RT 2"
#     Application = "Proteus"
#     Project     = "Proteus GraphQL API"
#     Tier        = "Backend"
#   }
# }
