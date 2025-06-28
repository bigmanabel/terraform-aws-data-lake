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

variable "glue_service_role_arn" {
  description = "ARN of the Glue service role"
  type        = string
}

variable "raw_data_bucket_name" {
  description = "Name of the raw data S3 bucket"
  type        = string
}

variable "raw_data_prefix" {
  description = "Prefix for raw data in S3 bucket"
  type        = string
  default     = "raw/"
}

variable "crawler_schedule" {
  description = "Cron expression for Glue crawler schedule"
  type        = string
  default     = "cron(0 * * * ? *)" # Every hour
}
