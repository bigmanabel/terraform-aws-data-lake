output "workgroup_name" {
  description = "Name of the Athena workgroup"
  value       = aws_athena_workgroup.data_lake.name
}

output "workgroup_arn" {
  description = "ARN of the Athena workgroup"
  value       = aws_athena_workgroup.data_lake.arn
}

output "named_queries" {
  description = "Named queries created for the workgroup"
  value = {
    show_tables  = aws_athena_named_query.show_tables.name
    sample_query = aws_athena_named_query.sample_query.name
  }
}
