# Glue Data Catalog Database
resource "aws_glue_catalog_database" "data_lake" {
  name        = "${var.project_name}_database"
  description = "Data lake database for ${var.project_name}"

  catalog_id = data.aws_caller_identity.current.account_id

  tags = merge(var.common_tags, {
    Name        = "${var.project_name}_database"
    Service     = "AWS Glue"
    Environment = var.environment
  })
}

# Glue Crawler
resource "aws_glue_crawler" "data_lake_crawler" {
  name          = "${var.project_name}-crawler"
  role          = var.glue_service_role_arn
  database_name = aws_glue_catalog_database.data_lake.name
  description   = "Crawler for ${var.project_name} data lake"

  s3_target {
    path = "s3://${var.raw_data_bucket_name}/${var.raw_data_prefix}"
  }

  # Schedule to run every hour
  schedule = var.crawler_schedule

  # Crawler configuration
  configuration = jsonencode({
    Version = 1.0
    CrawlerOutput = {
      Partitions = {
        AddOrUpdateBehavior = "InheritFromTable"
      }
    }
    Grouping = {
      TableGroupingPolicy = "CombineCompatibleSchemas"
    }
  })

  schema_change_policy {
    update_behavior = "UPDATE_IN_DATABASE"
    delete_behavior = "DEPRECATE_IN_DATABASE"
  }

  tags = merge(var.common_tags, {
    Name        = "${var.project_name}-crawler"
    Service     = "AWS Glue"
    Environment = var.environment
  })
}

# Data source to get current AWS account ID
data "aws_caller_identity" "current" {}
