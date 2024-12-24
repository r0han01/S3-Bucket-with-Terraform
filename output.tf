output "s3_bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.r0han.bucket
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.r0han.arn
}

output "s3_bucket_region" {
  description = "The region of the S3 bucket"
  value       = aws_s3_bucket.r0han.region
}

output "s3_bucket_hosted_zone_id" {
  description = "The hosted zone ID of the S3 bucket"
  value       = aws_s3_bucket.r0han.hosted_zone_id
}


output "s3_bucket_website_domain" {
  description = "The website domain of the S3 bucket"
  value       = aws_s3_bucket.r0han.website_domain
}

output "s3_bucket_object_lock_configuration" {
  description = "The object lock configuration of the S3 bucket"
  value       = aws_s3_bucket.r0han.object_lock_configuration
}

output "s3_bucket_cors_rule" {
  description = "The CORS configuration for the S3 bucket"
  value       = aws_s3_bucket.r0han.cors_rule
}

output "s3_bucket_lifecycle_rule" {
  description = "The lifecycle rule for the S3 bucket"
  value       = aws_s3_bucket.r0han.lifecycle_rule
}

output "s3_bucket_versioning" {
  description = "The versioning configuration of the S3 bucket"
  value       = aws_s3_bucket.r0han.versioning
}

output "s3_bucket_logging" {
  description = "The logging configuration of the S3 bucket"
  value       = aws_s3_bucket.r0han.logging
}

output "s3_bucket_tags" {
  description = "The tags applied to the S3 bucket"
  value       = aws_s3_bucket.r0han.tags
}

output "s3_bucket_acceleration_status" {
  description = "The transfer acceleration status of the S3 bucket"
  value       = aws_s3_bucket.r0han.acceleration_status
}

output "s3_bucket_replication_configuration" {
  description = "The replication configuration of the S3 bucket"
  value       = aws_s3_bucket.r0han.replication_configuration
}


output "s3_bucket_policy" {
  description = "The bucket policy of the S3 bucket"
  value       = aws_s3_bucket.r0han.policy
}
