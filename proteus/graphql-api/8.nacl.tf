# Create Network Access Control List (NACL) for Public Subnets
# terraform aws create network acl
resource "aws_network_acl" "public-nacl" {
  vpc_id = aws_vpc.vpc.id

  # allow SSH access from anywhere
  ingress {
    action     = "allow"
    from_port  = 22
    to_port    = 22
    protocol   = "tcp"
    rule_no    = 100
    cidr_block = "0.0.0.0/0"
  }

  # allow HTTP access from anywhere
  ingress {
    action     = "allow"
    from_port  = 80
    to_port    = 80
    protocol   = "tcp"
    rule_no    = 200
    cidr_block = "0.0.0.0/0"
  }

  # allow HTTPS access from anywhere
  ingress {
    action     = "allow"
    from_port  = 443
    to_port    = 443
    protocol   = "tcp"
    rule_no    = 300
    cidr_block = "0.0.0.0/0"
  }

  # allow ingress ephemeral ports
  ingress {
    action     = "allow"
    from_port  = 1024
    to_port    = 65535
    protocol   = "tcp"
    rule_no    = 400
    cidr_block = "0.0.0.0/0"
  }

  egress {
    action     = "allow"
    from_port  = 22
    to_port    = 22
    protocol   = "tcp"
    rule_no    = 100
    cidr_block = "0.0.0.0/0"
  }

  egress {
    action     = "allow"
    from_port  = 80
    to_port    = 80
    protocol   = "tcp"
    rule_no    = 200
    cidr_block = "0.0.0.0/0"
  }

  egress {
    action     = "allow"
    from_port  = 443
    to_port    = 443
    protocol   = "tcp"
    rule_no    = 300
    cidr_block = "0.0.0.0/0"
  }

  egress {
    action     = "allow"
    from_port  = 1024
    to_port    = 65535
    protocol   = "tcp"
    rule_no    = 400
    cidr_block = "0.0.0.0/0"
  }
  tags = {
    Name        = "Proteus GraphQL API Public NACL"
    Application = "Proteus"
    Project     = "Proteus GraphQL API"
    Tier        = "Backend"
  }
}
