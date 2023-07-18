# Create Public Subnet 1
# terraform aws create subnet
resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public-subnet-1-cidr
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true
  tags = {
    Name        = "Proteus GraphQL API Public Subnet 1"
    Application = "Proteus"
    Project     = "Proteus GraphQL API"
    Tier        = "Backend"
  }
}

# Create Public Subnet 2
# terraform aws create subnet
resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public-subnet-2-cidr
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = true
  tags = {
    Name        = "Proteus GraphQL API Public Subnet 2"
    Application = "Proteus"
    Project     = "Proteus GraphQL API"
    Tier        = "Backend"
  }
}

# Create Private Subnet 1
# terraform aws create subnet
resource "aws_subnet" "private-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private-subnet-1-cidr
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = false
  tags = {
    Name        = "Proteus GraphQL API Private Subnet 1"
    Application = "Proteus"
    Project     = "Proteus GraphQL API"
    Tier        = "Backend"
  }
}

# Create Private Subnet 2
# terraform aws create subnet
resource "aws_subnet" "private-subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private-subnet-2-cidr
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = false
  tags = {
    Name        = "Proteus GraphQL API Private Subnet 2"
    Application = "Proteus"
    Project     = "Proteus GraphQL API"
    Tier        = "Backend"
  }
}

# ===== Route Table Associations =====

# Associate Public Subnet 1 with Public Route Table
# terraform aws associate subnet with route table
resource "aws_route_table_association" "public-subnet-1-route-table-association" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-route-table.id
}

# Associate Public Subnet 2 with Public Route Table
# terraform aws associate subnet with route table
resource "aws_route_table_association" "public-subnet-2-route-table-association" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public-route-table.id
}

# Associate Private Subnet 1 with Private Route Table 1
# terraform aws associate subnet with route table
# resource "aws_route_table_association" "private-subnet-1-route-table-association" {
#   subnet_id      = aws_subnet.private-subnet-1.id
#   route_table_id = aws_route_table.private-route-table-1.id
# }

# Associate Private Subnet 2 with Private Route Table 2
# terraform aws associate subnet with route table
# resource "aws_route_table_association" "private-subnet-2-route-table-association" {
#   subnet_id      = aws_subnet.private-subnet-2.id
#   route_table_id = aws_route_table.private-route-table-2.id
# }

# ===== Network ACL Associations =====

# Associate Public Subnet 1 with Public NACL
# terraform aws associate subnet with network acl
# resource "aws_network_acl_association" "public-subnet-1-network-acl-association" {
#   subnet_id      = aws_subnet.public-subnet-1.id
#   network_acl_id = aws_network_acl.public-nacl.id
# }

# Associate Public Subnet 2 with Public NACL
# terraform aws associate subnet with network acl
# resource "aws_network_acl_association" "public-subnet-2-network-acl-association" {
#   subnet_id      = aws_subnet.public-subnet-2.id
#   network_acl_id = aws_network_acl.public-nacl.id
# }
