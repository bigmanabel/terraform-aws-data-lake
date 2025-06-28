# Athena Workgroup
resource "aws_athena_workgroup" "data_lake" {
  name        = "${var.project_name}_workgroup"
  description = "Athena workgroup for ${var.project_name} data lake"
  state       = "ENABLED"

  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = var.enable_cloudwatch_metrics

    result_configuration {
      output_location = "s3://${var.athena_results_bucket_name}/results/"

      encryption_configuration {
        encryption_option = "SSE_S3"
      }
    }

    bytes_scanned_cutoff_per_query = var.bytes_scanned_cutoff_per_query
  }

  tags = merge(var.common_tags, {
    Name        = "${var.project_name}_workgroup"
    Service     = "Amazon Athena"
    Environment = var.environment
  })
}

# Athena Data Catalog (references the Glue database)
resource "aws_athena_database" "data_lake" {
  count  = var.create_athena_database ? 1 : 0
  name   = var.glue_database_name
  bucket = var.athena_results_bucket_name

  encryption_configuration {
    encryption_option = "SSE_S3"
  }
}

# Athena Named Queries for common operations
resource "aws_athena_named_query" "show_tables" {
  name        = "${var.project_name}_show_tables"
  workgroup   = aws_athena_workgroup.data_lake.name
  database    = var.glue_database_name
  description = "Show all tables in the data lake"

  query = "SHOW TABLES"
}

resource "aws_athena_named_query" "sample_query" {
  name        = "${var.project_name}_sample_data"
  workgroup   = aws_athena_workgroup.data_lake.name
  database    = var.glue_database_name
  description = "Sample query to explore data"

  query = <<-EOT
    -- Sample query for exploring data
    -- Replace 'your_table_name' with actual table name
    SELECT *
    FROM "your_table_name"
    LIMIT 10;
  EOT
}
