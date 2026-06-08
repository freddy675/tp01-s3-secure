# Récupérer l'ID du compte (Indispensable pour l'output)
data "aws_caller_identity" "current" {}

resource "random_pet" "bucket_suffix" {
  length    = 2
  separator = "-"
}

resource "aws_s3_bucket" "first" {
  bucket = "formation-terraform-${data.aws_caller_identity.current.account_id}-${random_pet.bucket_suffix.id}-v2"

  tags = {
    Name = "Bucket de test formation"
  }
}
