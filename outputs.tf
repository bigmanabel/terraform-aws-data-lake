# S3 Outputs
output "raw_data_bucket" {
  description = "S3 bucket for storing raw data"
  value       = module.s3.raw_data_bucket_name
}

output "raw_data_bucket_arn" {
  description = "ARN of the S3 bucket for storing raw data"
  value       = module.s3.raw_data_bucket_arn
}

output "athena_results_bucket" {
  description = "S3 bucket for storing Athena query results"
  value       = module.s3.athena_results_bucket_name
}

output "athena_results_bucket_arn" {
  description = "ARN of the S3 bucket for storing Athena query results"
  value       = module.s3.athena_results_bucket_arn
}

# IAM Outputs
output "glue_service_role_arn" {
  description = "ARN of the Glue service role"
  value       = module.iam.glue_service_role_arn
}

# Glue Outputs
output "glue_database_name" {
  description = "Name of the Glue Data Catalog database"
  value       = module.glue.database_name
}

output "glue_crawler_name" {
  description = "Name of the Glue crawler"
  value       = module.glue.crawler_name
}

# Athena Outputs
output "athena_workgroup_name" {
  description = "Name of the Athena workgroup"
  value       = module.athena.workgroup_name
}

output "athena_named_queries" {
  description = "Named queries available in Athena"
  value       = module.athena.named_queries
}

# Summary Output
output "data_lake_summary" {
  description = "Summary of the data lake infrastructure"
  value = {
    project_name          = var.project_name
    environment           = var.environment
    raw_data_bucket       = module.s3.raw_data_bucket_name
    athena_results_bucket = module.s3.athena_results_bucket_name
    glue_database         = module.glue.database_name
    glue_crawler          = module.glue.crawler_name
    athena_workgroup      = module.athena.workgroup_name
    region                = var.aws_region
  }
}
