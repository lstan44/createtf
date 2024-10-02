#!/bin/bash

# Check if a folder name was passed as an argument
if [ -z "$1" ]; then
  echo "Please provide a folder name for the Terraform configuration."
  exit 1
fi

# Set the folder name from the user input
FOLDER_NAME=$1

# Create the folder if it doesn't exist
mkdir -p $FOLDER_NAME

# Navigate to the folder
cd $FOLDER_NAME || { echo "Failed to create or navigate to $FOLDER_NAME"; exit 1; }

# Create all the necessary files and folders
touch main.tf variables.tf outputs.tf providers.tf terraform.tfvars versions.tf README.md

# Create empty main.tf content
cat <<EOL > main.tf
# Add your Terraform resources here
EOL

# Create commented-out variables.tf example
cat <<EOL > variables.tf
# Example variable declaration
# Uncomment and edit as needed

# variable "instance_type" {
#   description = "The instance type for the EC2 instance."
#   type        = string
#   default     = "t2.micro"
# }

# variable "ami_id" {
#   description = "The AMI ID to use for the EC2 instance."
#   type        = string
# }
EOL

# Create commented-out outputs.tf example
cat <<EOL > outputs.tf
# Example output declaration
# Uncomment and edit as needed

# output "instance_id" {
#   description = "The ID of the EC2 instance"
#   value       = aws_instance.web.id
# }

# output "bucket_name" {
#   description = "The name of the S3 bucket"
#   value       = aws_s3_bucket.example.bucket
# }
EOL

# Create commented-out terraform.tfvars example
cat <<EOL > terraform.tfvars
# Example variable values for terraform.tfvars
# Uncomment and edit as needed

# ami_id        = "ami-12345678"
# instance_type = "t2.medium"
EOL

# Create providers.tf content with templated folder name for backend key
cat <<EOL > providers.tf
terraform {
  backend "s3" {
    bucket  = "terraform-infrasec"
    key     = "${FOLDER_NAME}/terraform.tfstate"
    region  = "us-east-1"
    profile = "admin"
  }
}

provider "aws" {
  shared_config_files = ["~/.aws/config"]
  profile             = "admin"
  region              = "us-east-1"
}
EOL

# Create versions.tf content
cat <<EOL > versions.tf
terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.75.1"
    }
  }
}
EOL

# Create README.md content
cat <<EOL > README.md
# Terraform Configuration for $FOLDER_NAME

This Terraform project creates the necessary infrastructure for $FOLDER_NAME.

## How to Use

1. Initialize Terraform:
   \`\`\`
   terraform init
   \`\`\`

2. Apply the configuration:
   \`\`\`
   terraform apply
   \`\`\`

Make sure to customize the variables in \`terraform.tfvars\` according to your environment.
EOL

# Print a success message
echo "Terraform project structure created successfully in the $FOLDER_NAME folder."

