# Local values for common configuration
locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = var.owner
  }
}

# S3 Module - Storage layer
module "s3" {
  source = "./modules/s3"

  project_name      = var.project_name
  environment       = var.environment
  common_tags       = local.common_tags
  enable_versioning = var.enable_s3_versioning
}

# IAM Module - Security layer
module "iam" {
  source = "./modules/iam"

  project_name              = var.project_name
  environment               = var.environment
  common_tags               = local.common_tags
  raw_data_bucket_arn       = module.s3.raw_data_bucket_arn
  athena_results_bucket_arn = module.s3.athena_results_bucket_arn
}

# Glue Module - Data catalog and ETL layer
module "glue" {
  source = "./modules/glue"

  project_name          = var.project_name
  environment           = var.environment
  common_tags           = local.common_tags
  glue_service_role_arn = module.iam.glue_service_role_arn
  raw_data_bucket_name  = module.s3.raw_data_bucket_name
  raw_data_prefix       = var.raw_data_prefix
  crawler_schedule      = var.crawler_schedule
}

# Athena Module - Query layer
module "athena" {
  source = "./modules/athena"

  project_name                   = var.project_name
  environment                    = var.environment
  common_tags                    = local.common_tags
  athena_results_bucket_name     = module.s3.athena_results_bucket_name
  glue_database_name             = module.glue.database_name
  enable_cloudwatch_metrics      = var.enable_athena_cloudwatch_metrics
  bytes_scanned_cutoff_per_query = var.athena_bytes_scanned_cutoff
}
