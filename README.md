# Create an S3 Bucket with Terraform

This guide demonstrates how to create an Amazon S3 bucket using Terraform. The configuration creates a bucket and sets it to private access. It also explains how to resolve errors related to ACL settings.

## Prerequisites

- **AWS Account**: You need an AWS account to create resources.
- **Terraform Installed**: Terraform should be installed on your local machine. You can download it from [Terraform's official website](https://www.terraform.io/downloads).
- **AWS CLI**: AWS CLI should be installed to configure your AWS credentials and interact with AWS from the command line.

## Steps to Set Up

### 1. Configure AWS Credentials

You need to provide your AWS Access Key and Secret Key in the Terraform provider configuration. Ensure you replace these keys with your own credentials for security reasons. These credentials can be set using environment variables or the `aws configure` command.

```bash
aws configure
```
### 2. Create a Terraform Configuration File
Create a file called main.tf in your project directory with the following contents:

```hcl
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "YOUR_ACCESS_KEY_HERE"  # Replace with your access key
  secret_key = "YOUR_SECRET_KEY_HERE"  # Replace with your secret key
}

resource "aws_s3_bucket" "r0han" {
  bucket = "my-unique-r0han"  # Ensure this is a globally unique name
  acl    = "private"
}
```
Note: The access_key and secret_key should be replaced with your own AWS credentials. The provided keys in the example are placeholders.

### 3. Run Terraform Commands
Initialize Terraform
Initialize your working directory containing the Terraform configuration files.

```bash
terraform init
```
Validate the Configuration
Check if your configuration is syntactically correct.

```bash
terraform validate
```
Plan the Deployment
Terraform will show the actions it plans to take.

```bash
terraform plan
```
Apply the Configuration
Once the plan looks good, apply the configuration to create the resources.

```bash
terraform apply
```
You will be prompted to confirm by typing yes.

### 4. Fixing the "ACL Not Supported" Error
If you encounter the following error:

```yaml
Error: updating S3 Bucket (my-unique-r0han) ACL: AccessControlListNotSupported: The bucket does not allow ACLs
status code: 400, request id: XYZ, host id: ABC
This error occurs when the bucket does not allow ACLs due to AWS settings like Block Public Access.
```

## Solution:
- Go to `IAM` > `Roles` in the AWS Console.
- Create a role for your AWS account and attach S3-related policies, including `AmazonS3FullAccess` and `OutpostsS3Access`.
- Once the role is created, re-run the terraform apply command after updating your IAM role settings.
- After following these steps, Terraform should be able to create the bucket without encountering the ACL error.

### Common Terraform Commands
- Initialize the working directory:

```bash
terraform init
```
- Validate your configuration files:

```bash
terraform validate
```
- Preview the actions Terraform will take:

```bash
terraform plan
```
- Apply your configuration to create the resources:

```bash
terraform apply -auto-approve -var-file="secrets.tfvars
```
- Destroy the resources (if you no longer need them):

```bash
terraform destroy
```
### Important Notes
- Bucket Name: S3 bucket names must be globally unique across all AWS accounts. If the name my-unique-r0han is already taken by someone else, change it to something else like my-unique-r0han-2024.
- Access Keys: The access_key and secret_key should not be shared publicly. Always replace the sample keys with your own credentials.
- Permissions: Ensure that your IAM role has the necessary permissions for creating and managing S3 buckets. You can use the AmazonS3FullAccess policy for the required permissions.