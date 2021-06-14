# Fetch AZs in the current region
data "aws_availability_zones" "available" {}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Create 2 public subnets, each in a different AZ
resource "aws_subnet" "main" {
  count                   = 2
  cidr_block              = "${cidrsubnet(aws_vpc.main.cidr_block, 8, 2 + count.index)}"
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
  vpc_id                  = "${aws_vpc.main.id}"
  map_public_ip_on_launch = true
}

# IGW for the public subnet
resource "aws_internet_gateway" "gateway" {
  vpc_id = "${aws_vpc.main.id}"
}

# Create a new route table for the public subnets
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"
}

# Route the public subnet traffic through the IGW
resource "aws_route" "internet-gateway-route" {
  route_table_id         = "${aws_route_table.public.id}"
  gateway_id             = "${aws_internet_gateway.gateway.id}"
  destination_cidr_block = "0.0.0.0/0"
}

# Explicitely associate the newly created route tables to the public subnets
resource "aws_route_table_association" "public" {
  count          = 2
  subnet_id      = "${element(aws_subnet.main.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}

# Security group for the ECS cluster 
resource "aws_security_group" "ecs_security_group" {
  name   = "fargate-security-group"
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ECS 
resource "aws_ecs_cluster" "main" {
  name = "selenium-cluster"
}

resource "aws_ecs_task_definition" "hub" {
  family                   = "hub"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "2048"
  memory                   = "14336"

  container_definitions = <<DEFINITION
[
  {
    "cpu": 512,
    "image": "selenium/hub:latest",
    "memory": 2048,
    "name": "selenium",
    "networkMode": "awsvpc",
    "portMappings": [
      {
        "containerPort": 4444,
        "hostPort": 4444
      }
    ],
    "environment": [
      {
          "name": "GRID_MAX_SESSION",
          "value": "24"
      },
      {
          "name": "TIMEOUT",
          "value": "1200000"
      },
      {
          "name": "GRID_TIMEOUT",
          "value": "1200000"
      },
      {
          "name": "GRID_NEW_SESSION_WAIT_TIMEOUT",
          "value": "1200000"
      }
    ]
  },
  {
    "cpu": 256,
    "image": "selenium/node-firefox:latest",
    "memory": 2048,
    "name": "firefox-node-1",
    "networkMode": "awsvpc",
    "environment": [
      {
          "name": "NODE_MAX_SESSION",
          "value": "4"
      },
	  {
          "name": "NODE_MAX_INSTANCES",
          "value": "4"
      },
      {
          "name": "HUB_PORT_4444_TCP_ADDR",
          "value": "localhost"
      },
      {
          "name": "HUB_PORT_4444_TCP_PORT",
          "value": "4444"
      },
      {
          "name": "SE_OPTS",
          "value": "-port 5595"
      }
    ],
    "privileged" : false
  },
   {
    "cpu": 256,
    "image": "selenium/node-firefox:latest",
    "memory": 2048,
    "name": "firefox-node-2",
    "networkMode": "awsvpc",
    "environment": [
      {
          "name": "NODE_MAX_SESSION",
          "value": "4"
      },
	  {
          "name": "NODE_MAX_INSTANCES",
          "value": "4"
      },
      {
          "name": "HUB_PORT_4444_TCP_ADDR",
          "value": "localhost"
      },
      {
          "name": "HUB_PORT_4444_TCP_PORT",
          "value": "4444"
      },
      {
          "name": "SE_OPTS",
          "value": "-port 5596"
      }
    ],
    "privileged" : false
  },
   {
    "cpu": 256,
    "image": "selenium/node-firefox:latest",
    "memory": 2048,
    "name": "firefox-node-3",
    "networkMode": "awsvpc",
    "environment": [
      {
          "name": "NODE_MAX_SESSION",
          "value": "4"
      },
	  {
          "name": "NODE_MAX_INSTANCES",
          "value": "4"
      },
      {
          "name": "HUB_PORT_4444_TCP_ADDR",
          "value": "localhost"
      },
      {
          "name": "HUB_PORT_4444_TCP_PORT",
          "value": "4444"
      },
      {
          "name": "SE_OPTS",
          "value": "-port 5597"
      }
    ],
    "privileged" : false
  },
  {
    "cpu": 256,
    "image": "selenium/node-firefox:latest",
    "memory": 2048,
    "name": "firefox-node-4",
    "networkMode": "awsvpc",
    "environment": [
      {
          "name": "NODE_MAX_SESSION",
          "value": "4"
      },
	  {
          "name": "NODE_MAX_INSTANCES",
          "value": "4"
      },
      {
          "name": "HUB_PORT_4444_TCP_ADDR",
          "value": "localhost"
      },
      {
          "name": "HUB_PORT_4444_TCP_PORT",
          "value": "4444"
      },
      {
          "name": "SE_OPTS",
          "value": "-port 5598"
      }
    ],
    "privileged" : false
  },
  {
    "cpu": 256,
    "image": "selenium/node-firefox:latest",
    "memory": 2048,
    "name": "firefox-node-5",
    "networkMode": "awsvpc",
    "environment": [
      {
          "name": "NODE_MAX_SESSION",
          "value": "4"
      },
	  {
          "name": "NODE_MAX_INSTANCES",
          "value": "4"
      },
      {
          "name": "HUB_PORT_4444_TCP_ADDR",
          "value": "localhost"
      },
      {
          "name": "HUB_PORT_4444_TCP_PORT",
          "value": "4444"
      },
      {
          "name": "SE_OPTS",
          "value": "-port 5599"
      }
    ],
    "privileged" : false
  },
  {
    "cpu": 256,
    "image": "selenium/node-firefox:latest",
    "memory": 2048,
    "name": "firefox-node-6",
    "networkMode": "awsvpc",
    "environment": [
      {
          "name": "NODE_MAX_SESSION",
          "value": "4"
      },
	   {
          "name": "NODE_MAX_INSTANCES",
          "value": "4"
      },
      {
          "name": "HUB_PORT_4444_TCP_ADDR",
          "value": "localhost"
      },
      {
          "name": "HUB_PORT_4444_TCP_PORT",
          "value": "4444"
      },
      {
          "name": "SE_OPTS",
          "value": "-port 5600"
      }
    ],
    "privileged" : false
  }
]
DEFINITION
}

resource "aws_ecs_service" "ecs-service" {
  name            = "selenium-service"
  cluster         = "${aws_ecs_cluster.main.id}"
  task_definition = "${aws_ecs_task_definition.hub.arn}"
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = ["${aws_security_group.ecs_security_group.id}"]
    subnets          = ["${aws_subnet.main[0].id}", "${aws_subnet.main[1].id}" ]
    assign_public_ip = true
  }
}
