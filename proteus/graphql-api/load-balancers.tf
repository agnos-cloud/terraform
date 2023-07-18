# resource "aws_lb" "lb-1" {
#   name               = "lb-1"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.alb-security-group.id]
#   subnets            = [aws_subnet.public-subnet-1.id]
# }

# resource "aws_lb" "lb-2" {
#   name               = "lb-2"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.alb-security-group.id]
#   subnets            = [aws_subnet.public-subnet-2.id]
# }

# resource "aws_lb_target_group" "http-target-graphql-1" {
#   name     = "graphql-api-1-http"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.vpc.id
# }

# resource "aws_lb_target_group" "http-target-graphql-2" {
#   name     = "graphql-api-2-http"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.vpc.id
# }

# resource "aws_lb_target_group" "https-target-graphql-1" {
#   name     = "graphql-api-1-https"
#   port     = 443
#   protocol = "HTTPS"
#   vpc_id   = aws_vpc.vpc.id
# }

# resource "aws_lb_target_group" "https-target-graphql-2" {
#   name     = "graphql-api-2-https"
#   port     = 443
#   protocol = "HTTPS"
#   vpc_id   = aws_vpc.vpc.id
# }
