output "database_name" {
  description = "Name of the Glue catalog database"
  value       = aws_glue_catalog_database.data_lake.name
}

output "database_arn" {
  description = "ARN of the Glue catalog database"
  value       = aws_glue_catalog_database.data_lake.arn
}

output "crawler_name" {
  description = "Name of the Glue crawler"
  value       = aws_glue_crawler.data_lake_crawler.name
}

output "crawler_arn" {
  description = "ARN of the Glue crawler"
  value       = aws_glue_crawler.data_lake_crawler.arn
}
