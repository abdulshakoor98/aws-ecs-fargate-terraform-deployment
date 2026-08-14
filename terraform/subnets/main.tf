resource "aws_subnet" "public_1" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.project_name}-public-subnet-1"
    Environment = "production"
    Type        = "public"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.project_name}-public-subnet-2"
    Environment = "production"
    Type        = "public"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.11.0/24"
  availability_zone = var.availability_zone_1

  tags = {
    Name        = "${var.project_name}-private-subnet-1"
    Environment = "production"
    Type        = "private"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.12.0/24"
  availability_zone = var.availability_zone_2

  tags = {
    Name        = "${var.project_name}-private-subnet-2"
    Environment = "production"
    Type        = "private"
  }
}