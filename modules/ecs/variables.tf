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
