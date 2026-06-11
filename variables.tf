variable "instance_type" {
  description = "Type de l'instance EC2"
  type        = string
  default     = "t3.micro"
}

variable "vpc_id" {
  description = "ID du VPC"
  type        = string
}

variable "subnet_id" {
  description = "ID du Subnet"
  type        = string
}

variable "aws_region" {
  description = "Region AWS"
  type        = string
  default     = "eu-west-3"
}

variable "project" {
  description = "Nom du projet"
  type        = string
  default     = "tp03-ec2"
}

variable "environment" {
  description = "Environnement"
  type        = string
  default     = "dev"
}
