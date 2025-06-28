# IAM role for AWS Glue
resource "aws_iam_role" "glue_service_role" {
  name = "${var.project_name}-glue-service-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "glue.amazonaws.com"
        }
      }
    ]
  })

  tags = merge(var.common_tags, {
    Name        = "${var.project_name}-glue-service-role"
    Service     = "AWS Glue"
    Environment = var.environment
  })
}

# Attach AWS managed policy for Glue service
resource "aws_iam_role_policy_attachment" "glue_service_role_policy" {
  role       = aws_iam_role.glue_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

# Custom policy for S3 access
resource "aws_iam_policy" "glue_s3_policy" {
  name        = "${var.project_name}-glue-s3-policy"
  description = "Policy for Glue to access S3 buckets"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ]
        Resource = [
          "${var.raw_data_bucket_arn}",
          "${var.raw_data_bucket_arn}/*",
          "${var.athena_results_bucket_arn}",
          "${var.athena_results_bucket_arn}/*"
        ]
      }
    ]
  })

  tags = merge(var.common_tags, {
    Name        = "${var.project_name}-glue-s3-policy"
    Environment = var.environment
  })
}

# Attach custom S3 policy to Glue role
resource "aws_iam_role_policy_attachment" "glue_s3_policy_attachment" {
  role       = aws_iam_role.glue_service_role.name
  policy_arn = aws_iam_policy.glue_s3_policy.arn
}
