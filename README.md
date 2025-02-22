# Multi-Environment AWS Infrastructure Deployment with Terraform

## Overview
This project provides an automated approach to deploy AWS infrastructure using Terraform across multiple environments (Development, Staging, and Production). It provisions EC2 instances, security groups, an S3 bucket, and a DynamoDB table for state management.

## Infrastructure Components
The Terraform configuration in this repository creates the following AWS resources:
- **EC2 Instances**: Virtual machines provisioned based on environment-specific configurations.
- **Security Groups**: Firewall rules to control inbound and outbound traffic.
- **S3 Bucket**: Used for storing Terraform state files.
- **DynamoDB Table**: Used for Terraform state locking.

## Folder Structure
```
├── aws_infra/                  # Terraform module for AWS infrastructure
│   ├── ec2.tf                  # Defines EC2 instances
│   ├── s3.tf                   # Defines S3 bucket
│   ├── dynamodb.tf             # Defines DynamoDB table
│   ├── variables.tf            # Variables used in Terraform scripts
│   ├── outputs.tf              # Terraform output values (if any)
│   ├── main.tf                 # Module implementation
├── main.tf                      # Main Terraform configuration file (calls modules)
├── terraform.tf                 # Terraform provider configuration
├── README.md                    # Documentation file (this file)
```

## Prerequisites
Before running this Terraform configuration, ensure you have:
- An **AWS account** with necessary IAM permissions
- **Terraform v1.0+** installed ([Install Terraform](https://developer.hashicorp.com/terraform/downloads))
- **AWS CLI** configured ([Install AWS CLI](https://aws.amazon.com/cli/))

## Usage

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/your-repo.git
cd your-repo
```

### 2. Initialize Terraform
```bash
terraform init
```
This command initializes Terraform and downloads the required provider plugins.

### 3. Plan the Infrastructure Changes
```bash
terraform plan
```
This command shows the changes that Terraform will make to your infrastructure.

### 4. Apply the Configuration
```bash
terraform apply
```
Type `yes` when prompted to confirm the deployment.

### 5. Destroy Infrastructure (Optional)
To remove all resources created by Terraform:
```bash
terraform destroy
```
Type `yes` when prompted to confirm destruction.

## Variables
The following variables can be customized in the `variables.tf` file:
| Variable       | Description                               | Default Value |
|---------------|-------------------------------------------|---------------|
| aws_region    | AWS region for deployment               | us-east-1     |
| my-env        | Deployment environment (dev, stg, prd)  | None          |
| ami_id        | AMI ID for EC2 instances                | None          |
| instance_type | EC2 instance type (e.g., t2.micro)      | None          |
| instance_count| Number of instances to deploy          | None          |

## Multi-Environment Configuration
This project supports multiple environments using Terraform modules:
- **Development** (`dev`): Deploys 1 `t2.micro` instance.
- **Staging** (`stg`): Deploys 2 `t2.medium` instances.
- **Production** (`prd`): Deploys 3 `t2.large` instances.

Defined in `main.tf`:
```hcl
module "dev-app" {
    source = "./aws_infra"
    my-env = "dev"
    instance_type = "t2.micro"
    ami_id = "ami-04b4f1a9cf54c11d0"
    instance_count = 1
}
```
