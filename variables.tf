# Core Configuration
variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project (used for resource naming)"
  type        = string
  default     = "data-lake"

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.project_name))
    error_message = "Project name must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "owner" {
  description = "Owner of the resources"
  type        = string
  default     = "data-team"
}

# S3 Configuration
variable "raw_data_prefix" {
  description = "Prefix for raw data in S3 bucket"
  type        = string
  default     = "raw/"
}

variable "enable_s3_versioning" {
  description = "Enable versioning for S3 buckets"
  type        = bool
  default     = true
}

# Glue Configuration
variable "crawler_schedule" {
  description = "Cron expression for Glue crawler schedule"
  type        = string
  default     = "cron(0 * * * ? *)" # Every hour

  validation {
    condition     = can(regex("^cron\\(.*\\)$", var.crawler_schedule))
    error_message = "Crawler schedule must be a valid cron expression."
  }
}

# Athena Configuration
variable "enable_athena_cloudwatch_metrics" {
  description = "Enable CloudWatch metrics for Athena workgroup"
  type        = bool
  default     = true
}

variable "athena_bytes_scanned_cutoff" {
  description = "The upper data usage limit (cutoff) for the amount of bytes a single query in a workgroup is allowed to scan (in bytes)"
  type        = number
  default     = null
}
