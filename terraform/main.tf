terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./vpc"

  vpc_cidr     = "10.0.0.0/16"
  project_name = var.project_name
}

module "subnets" {
  source = "./subnets"

  vpc_id              = module.vpc.vpc_id
  project_name        = var.project_name
  availability_zone_1 = "ap-south-1a"
  availability_zone_2 = "ap-south-1b"
}

module "networking" {
  source = "./networking"

  vpc_id              = module.vpc.vpc_id
  public_subnet_1_id  = module.subnets.public_subnet_1_id
  public_subnet_2_id  = module.subnets.public_subnet_2_id
  private_subnet_1_id = module.subnets.private_subnet_1_id
  private_subnet_2_id = module.subnets.private_subnet_2_id
  project_name        = var.project_name
}

module "security_group" {
  source = "./security-group"

  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
}

module "ecr" {
  source = "./ecr"

  project_name = var.project_name
}
module "iam" {
  source = "./iam"

  project_name = var.project_name
}

module "alb" {
  source = "./alb"

  project_name          = var.project_name
  vpc_id                = module.vpc.vpc_id
  public_subnet_1_id    = module.subnets.public_subnet_1_id
  public_subnet_2_id    = module.subnets.public_subnet_2_id
  alb_security_group_id = module.security_group.alb_security_group_id
}

module "ecs" {
  source = "./ecs"

  project_name = var.project_name
  aws_region   = var.aws_region

  private_subnet_1_id = module.subnets.private_subnet_1_id
  private_subnet_2_id = module.subnets.private_subnet_2_id

  ecs_security_group_id = module.security_group.ecs_security_group_id

  execution_role_arn = module.iam.ecs_task_execution_role_arn
  task_role_arn      = module.iam.ecs_task_role_arn

  ecr_repository_url = module.ecr.repository_url

  target_group_arn = module.alb.target_group_arn
}