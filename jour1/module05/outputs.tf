output "bucket_id" {
  description = "L'ID (nom) du bucket S3"
  value       = aws_s3_bucket.secure_bucket.id
}

output "bucket_arn" {
  description = "L'ARN du bucket S3"
  value       = aws_s3_bucket.secure_bucket.arn
}
output "aws_region" {
  description = "La région AWS actuelle"
  value       = data.aws_region.current.name
}
