terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket         = "demo-terraform-ecs-state-bucket-0987"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-ecs-state-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
  cluster_name         = var.cluster_name

}

module "ecs" {
  source            = "./modules/ecs"
  cluster_name      = var.cluster_name
  family            = "users-microservice-task-definition"
  task_def_file     = file("task-definitions/service.json")
  cpu               = "512"
  memory            = "1024"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids

}
