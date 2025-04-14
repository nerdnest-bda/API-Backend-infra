variable "aws_region" {
  default = "us-east-1"
}

variable "container_image" {
  description = "Docker image URI for nerd-nest API"
  type        = string
}

variable "db_connection" {
  description = "Mongodb connection string"
  type        = string
}
