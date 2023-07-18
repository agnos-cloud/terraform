resource "aws_cloudwatch_log_group" "proteus_graphql_log_group" {
  name = "/ecs/proteus_graphql_api_task"
}

resource "aws_ecs_task_definition" "proteus_graphql_api_task" {
  family = "proteus_graphql_api_task"

  // Fargate is a type of ECS that requires awsvpc network_mode
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"

  // Valid sizes are shown here: https://aws.amazon.com/fargate/pricing/
  memory = "1024"
  cpu    = "512"

  // Fargate requires task definitions to have an execution role ARN to support ECR images
  execution_role_arn = aws_iam_role.ecs_role.arn

  container_definitions = jsonencode([
    {
      "name" : "graphql_api",
      "image" : "${var.aws_account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/graphql_api:latest",
      "cpu" : 10,
      "memory" : 500,
      "essential" : true,
      "environment" : [
        {
          "name" : "CLIENT_ORIGIN",
          "value" : "${var.CLIENT_ORIGIN}"
        },
        {
          "name" : "DATABASE_URL",
          "value" : "${var.DATABASE_URL}"
        },
        {
          "name" : "NEXTAUTH_URL",
          "value" : "${var.NEXTAUTH_URL}"
        },
        {
          "name" : "PINECONE_API_KEY",
          "value" : "${var.PINECONE_API_KEY}"
        },
        {
          "name" : "PINECONE_ENVIRONMENT",
          "value" : "${var.PINECONE_ENVIRONMENT}"
        },
        {
          "name" : "PINECONE_INDEX",
          "value" : "${var.PINECONE_INDEX}"
        },
        {
          "name" : "PORT",
          "value" : "${var.PORT}"
        }
      ],
      "portMappings" : [
        {
          "containerPort" : 3000,
          "hostPort" : 3000
        },
        {
          "containerPort" : 443,
          "hostPort" : 443
        },
        {
          "containerPort" : 80,
          "hostPort" : 80
        }
      ],
      "logConfiguration" : {
        "logDriver" : "awslogs",
        "options" : {
          "awslogs-create-group" : "true",
          "awslogs-group" : "/ecs/proteus_graphql_api_task",
          "awslogs-region" : "${var.aws_region}",
          "awslogs-stream-prefix" : "proteus_graphql_ecs"
        }
      }
    }
  ])
}

resource "aws_ecs_cluster" "proteus_graphql_api_cluster" {
  name = "proteus_graphql_api_cluster"
}

resource "aws_ecs_service" "proteus_graphql_api_service" {
  name = "proteus_graphql_api_service"

  cluster         = aws_ecs_cluster.proteus_graphql_api_cluster.id
  task_definition = aws_ecs_task_definition.proteus_graphql_api_task.arn

  launch_type   = "FARGATE"
  desired_count = 1

  network_configuration {
    subnets          = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
    security_groups  = [aws_security_group.alb-security-group.id]
    assign_public_ip = true
  }
}
