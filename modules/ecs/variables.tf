variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "demo-ecs-cluster"
}

variable "family" {
  description = "Name of the ECS task family"
  type        = string
  default     = "demo-app"
}

variable "memory" {
  description = "Memory for the ECS task"
  type        = string
  default     = "1024"
}

variable "cpu" {
  description = "CPU for the ECS task"
  type        = string
  default     = "512"
}

variable "task_def_file" {
  description = "Task definition file for the ECS task"
  type        = string
  default     = "task-definitions/service.json"
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs for the ECS service"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs for the ECS service"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "vpc_id" {
  description = "VPC ID for the ECS service"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for the ECS service"
  type        = list(string)
  default     = []

}
