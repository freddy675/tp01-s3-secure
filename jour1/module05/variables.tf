variable "bucket_name" {
  description = "Nom unique du bucket S3"
  type        = string
  default     = "mon-bucket-terraform-secure-votre-nom" # Changez 'votre-nom' par votre nom réel
}

variable "common_tags" {
  description = "Tags communs à appliquer aux ressources"
  type        = map(string)
  default = {
    Project     = "Formation-Terraform"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}
variable "project" {
  description = "Nom du projet"
  type        = string
  default     = "formation"
}

variable "environment" {
  description = "Environnement (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "Propriétaire des ressources"
  type        = string
  default     = "freddy"
}

variable "tags" {
  description = "Tags personnalisés de l'utilisateur"
  type        = map(string)
  default = {
    Team = "DevOps"
  }
}
