variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "athena_results_bucket_name" {
  description = "Name of the Athena results S3 bucket"
  type        = string
}

variable "glue_database_name" {
  description = "Name of the Glue catalog database"
  type        = string
}

variable "enable_cloudwatch_metrics" {
  description = "Enable CloudWatch metrics for Athena workgroup"
  type        = bool
  default     = true
}

variable "bytes_scanned_cutoff_per_query" {
  description = "The upper data usage limit (cutoff) for the amount of bytes a single query in a workgroup is allowed to scan"
  type        = number
  default     = null
}

variable "create_athena_database" {
  description = "Whether to create an Athena database (alternative to using Glue catalog directly)"
  type        = bool
  default     = false
}
