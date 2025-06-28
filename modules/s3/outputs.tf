output "raw_data_bucket_name" {
  description = "Name of the raw data S3 bucket"
  value       = aws_s3_bucket.raw_data.bucket
}

output "raw_data_bucket_arn" {
  description = "ARN of the raw data S3 bucket"
  value       = aws_s3_bucket.raw_data.arn
}

output "athena_results_bucket_name" {
  description = "Name of the Athena results S3 bucket"
  value       = aws_s3_bucket.athena_results.bucket
}

output "athena_results_bucket_arn" {
  description = "ARN of the Athena results S3 bucket"
  value       = aws_s3_bucket.athena_results.arn
}
