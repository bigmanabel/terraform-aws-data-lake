# 🏛️ AWS Data Lake Terraform Module

<div align="center">

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-FF9900?style=for-the-badge&logo=amazon-aws&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)
![Version](https://img.shields.io/badge/Version-2.0.0-blue.svg?style=for-the-badge)

**🚀 A comprehensive, modular Terraform solution for deploying enterprise-grade
AWS Data Lake infrastructure**

</div>

---

## 📖 Overview

🌊 **Serverless Data Lake on AWS** - A fully automated, scalable data lake
architecture built with Terraform that enables seamless ingestion, cataloging,
and querying of structured and semi-structured data using AWS-native services.

### 🎯 **What This Module Provides:**

- 🗄️ **Amazon S3** for scalable raw data storage and query results
- 🕷️ **AWS Glue** for automated schema discovery and metadata cataloging
- 🔍 **Amazon Athena** for serverless SQL queries directly against S3 data
- 🔐 **Enterprise Security** with encryption, access controls, and compliance
- 🏗️ **Modular Architecture** with clear separation of concerns
- 📊 **Cost Optimization** with intelligent resource configuration

Perfect for data engineering pipelines, analytics workloads, business
intelligence, and cloud-native ETL processes — all defined as **Infrastructure
as Code**.

## 🏗️ Architecture Overview

This project implements a **modular, enterprise-grade architecture** with clear
separation of concerns:

```text
┌─────────────────────────────────────────────────────────────────┐
│                     🏛️ AWS Data Lake Architecture                │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  📁 Data Ingestion    🏗️ Processing Layer    🔍 Query Layer     │
│                                                                 │
│  ┌─────────────┐     ┌─────────────────┐    ┌──────────────┐   │
│  │   Raw Data  │────▶│   AWS Glue      │────▶│   Athena     │   │
│  │   (S3 Raw)  │     │   Crawler/DB    │     │  Workgroup   │   │
│  └─────────────┘     └─────────────────┘    └──────────────┘   │
│                                                                 │
│  ┌─────────────┐     ┌─────────────────┐    ┌──────────────┐   │
│  │ ETL Results │     │   IAM Roles     │    │ Query Results│   │
│  │(S3 Processed)│    │   & Policies    │    │ (S3 Athena)  │   │
│  └─────────────┘     └─────────────────┘    └──────────────┘   │
└─────────────────────────────────────────────────────────────────┘
```

### 📂 **Project Structure**

```bash
terraform-aws-data-lake/
├── 📄 main.tf                 # Root module orchestration
├── 📄 variables.tf            # Root module variables
├── 📄 outputs.tf             # Root module outputs
├── 📄 terraform.tfvars       # Configuration values
├── 📄 provider.tf            # Provider configuration
├── 📁 modules/
│   ├── 🗄️ s3/                # Storage layer
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── 🔐 iam/               # Security layer
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── 🕷️ glue/              # Data catalog & ETL layer
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── 🔍 athena/            # Query layer
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── 📄 README.md              # This documentation
```

## 🎯 Key Improvements & Features

<table>
<tr>
<td width="50%">

### ✅ **Separation of Concerns**

- 🗄️ **S3 Module**: Manages all storage-related resources
- 🔐 **IAM Module**: Handles security and permissions
- 🕷️ **Glue Module**: Manages data catalog and crawlers
- 🔍 **Athena Module**: Handles query infrastructure

### ✅ **Enhanced Security**

- 🔒 S3 bucket encryption enabled
- 🚫 Public access blocked on all buckets
- 👥 Proper IAM roles with least privilege
- 🔐 Encrypted Athena query results

</td>
<td width="50%">

### ✅ **Better Configuration Management**

- ✅ Input validation for critical variables
- 🌍 Environment-specific configurations
- 🏷️ Comprehensive tagging strategy
- ⏰ Flexible crawler scheduling

### ✅ **Improved Observability**

- 📊 CloudWatch metrics for Athena (optional)
- 📋 Comprehensive outputs for all resources
- 🔍 Named queries for common operations

</td>
</tr>
</table>

---

## 🚀 Infrastructure Components

### 🗄️ **Storage Layer (S3)**

- **📥 Raw Data Bucket**: Stores incoming raw data
- **📤 Athena Results Bucket**: Stores query results
- **🔧 Features**: Versioning, encryption, public access blocking

### 🔐 **Security Layer (IAM)**

- **👤 Glue Service Role**: Allows Glue to access S3 and other services
- **📜 Custom Policies**: Least privilege access to required resources

### 🕷️ **Data Catalog Layer (Glue)**

- **🗂️ Database**: Data catalog for table schemas
- **🔍 Crawler**: Automatically discovers and catalogs data
- **🔧 Features**: Configurable scheduling, schema evolution handling

### 🔍 **Query Layer (Athena)**

- **🏢 Workgroup**: Isolated query environment
- **📝 Named Queries**: Pre-built queries for common operations
- **🔧 Features**: Cost controls, result encryption

## 📋 Prerequisites

Before deploying this data lake, ensure you have:

<table>
<tr>
<td width="50%">

### 🛠️ **Required Tools**

- ✅ **Terraform** >= 1.7
- ✅ **AWS CLI** configured
- ✅ **Git** for version control

</td>
<td width="50%">

### 🔑 **AWS Permissions**

- ✅ **S3** - Create/manage buckets
- ✅ **IAM** - Create roles/policies
- ✅ **Glue** - Create databases/crawlers
- ✅ **Athena** - Create workgroups

</td>
</tr>
</table>

---

## � Quick Start Guide

### 1️⃣ **Configure Variables**

Edit `terraform.tfvars` to customize your deployment:

```hcl
# Core Configuration
project_name = "my-awesome-data-lake"
environment  = "production"
owner        = "data-engineering-team"

# S3 Settings
enable_s3_versioning = true
raw_data_prefix     = "incoming-data/"

# Glue Settings
crawler_schedule = "cron(0 2 * * ? *)"  # Run daily at 2 AM

# Athena Settings
enable_athena_cloudwatch_metrics = true
```

### 2️⃣ **Deploy Infrastructure**

```bash
# Initialize Terraform
terraform init

# Review the deployment plan
terraform plan

# Deploy the infrastructure
terraform apply
```

### 3️⃣ **Verify Deployment**

```bash
# Get deployment summary
terraform output data_lake_summary

# List all outputs
terraform output
```

---

## ⚙️ Configuration Reference

### 🎯 **Core Settings**

| Variable       | Description                    | Default       | Required |
| -------------- | ------------------------------ | ------------- | -------- |
| `project_name` | Project identifier             | `"data-lake"` | ✅       |
| `environment`  | Environment (dev/staging/prod) | `"dev"`       | ❌       |
| `aws_region`   | AWS region                     | `"us-east-1"` | ❌       |
| `owner`        | Resource owner                 | `"data-team"` | ❌       |

### 🗄️ **S3 Settings**

| Variable               | Description          | Default  | Required |
| ---------------------- | -------------------- | -------- | -------- |
| `enable_s3_versioning` | Enable S3 versioning | `true`   | ❌       |
| `raw_data_prefix`      | Raw data prefix      | `"raw/"` | ❌       |

### 🕷️ **Glue Settings**

| Variable           | Description           | Default               | Required |
| ------------------ | --------------------- | --------------------- | -------- |
| `crawler_schedule` | Crawler cron schedule | `"cron(0 * * * ? *)"` | ❌       |

### 🔍 **Athena Settings**

| Variable                           | Description              | Default | Required |
| ---------------------------------- | ------------------------ | ------- | -------- |
| `enable_athena_cloudwatch_metrics` | Enable metrics           | `true`  | ❌       |
| `athena_bytes_scanned_cutoff`      | Query size limit (bytes) | `null`  | ❌       |

---

## 📊 Outputs & Resources

### 🎯 **Key Outputs**

The module provides comprehensive outputs for integration with other systems:

```bash
# Get summary of all created resources
terraform output data_lake_summary

# Individual resource outputs
terraform output raw_data_bucket         # S3 bucket for raw data
terraform output athena_results_bucket   # S3 bucket for query results
terraform output glue_database_name      # Glue catalog database
terraform output athena_workgroup_name   # Athena workgroup
```

### 📋 **Summary Output Example**

```json
{
  "project_name": "terraform-data-lake",
  "environment": "dev",
  "raw_data_bucket": "terraform-data-lake-raw-data",
  "athena_results_bucket": "terraform-data-lake-athena-results",
  "glue_database": "terraform-data-lake_database",
  "glue_crawler": "terraform-data-lake-crawler",
  "athena_workgroup": "terraform-data-lake_workgroup",
  "region": "us-east-1"
}
```

---

## 🎯 Next Steps & Usage Patterns

### 🚀 **Getting Started with Your Data Lake**

1. **📤 Upload Sample Data**

   ```bash
   aws s3 cp sample-data.csv s3://your-raw-bucket/raw/
   ```

2. **🕷️ Run Glue Crawler**

   ```bash
   aws glue start-crawler --name your-crawler-name
   ```

3. **🔍 Query with Athena**
   ```sql
   SELECT * FROM "your_database"."your_table" LIMIT 10;
   ```

### 🏗️ **Advanced Usage Patterns**

- **🔄 ETL Pipelines**: Add Glue ETL jobs for data transformation
- **📊 Analytics**: Connect with QuickSight for visualization
- **⚡ Real-time**: Integrate with Kinesis for streaming data
- **🤖 ML**: Use SageMaker for machine learning workflows

---

## 🧪 Testing & Validation

### 🔍 **Built-in Validation**

The module includes comprehensive validation:

- ✅ Input validation for all critical variables
- ✅ Resource naming convention enforcement
- ✅ Security best practices compliance
- ✅ Cost optimization checks

### 🧹 **Cleanup Resources**

To destroy the infrastructure and avoid charges:

```bash
# Review what will be destroyed
terraform plan -destroy

# Destroy all resources
terraform destroy

# Verify cleanup
aws s3 ls | grep your-project-name  # Should return nothing
```

---

## 🤝 Contributing & Support

### 🛠️ **Development Setup**

```bash
# Clone the repository
git clone https://github.com/your-org/terraform-aws-data-lake.git
cd terraform-aws-data-lake

# Install pre-commit hooks
pre-commit install

# Run tests
terraform fmt -check
terraform validate
```

### 📧 **Getting Help**

- 📚 **Documentation**: Check module-specific READMEs
- 🐛 **Issues**: Report bugs via GitHub Issues
- 💬 **Discussions**: Join our community discussions
- 📧 **Support**: Contact the data engineering team

---

## 📜 License & Acknowledgments

<div align="center">

**📄 Licensed under the MIT License**

Built with ❤️ Code Breakers

[![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=flat&logo=terraform&logoColor=white)](https://terraform.io)
[![AWS](https://img.shields.io/badge/AWS-FF9900?style=flat&logo=amazon-aws&logoColor=white)](https://aws.amazon.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

---

⭐ **If this module helped you, please consider giving it a star!** ⭐

</div>
