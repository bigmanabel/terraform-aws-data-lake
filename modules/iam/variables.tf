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

variable "raw_data_bucket_arn" {
  description = "ARN of the raw data S3 bucket"
  type        = string
}

variable "athena_results_bucket_arn" {
  description = "ARN of the Athena results S3 bucket"
  type        = string
}
