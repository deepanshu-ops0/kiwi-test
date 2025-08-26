# S3 Bucket Terraform Configuration

This directory contains Terraform configuration for deploying a secure AWS S3 bucket.

## Features

- **Unique Bucket Name**: Automatically generates a unique bucket name with date suffix
- **Security Best Practices**:
  - Public access blocking
  - Server-side encryption with AES-256
  - ACLs disabled (using bucket policies instead)
  - Versioning enabled for data protection
- **Configurable Options**: All major settings can be customized via variables

## Usage

1. Initialize Terraform:
   ```
   terraform init
   ```

2. Review the plan:
   ```
   terraform plan
   ```

3. Apply the configuration:
   ```
   terraform apply
   ```

## Configuration Variables

You can customize the deployment by modifying the variables in `variables.tf` or by providing values at runtime:

| Variable | Description | Default |
|----------|-------------|---------|
| aws_region | AWS region to deploy resources | us-east-1 |
| environment | Environment name (dev, staging, prod) | dev |
| bucket_base_name | Base name for S3 bucket | deepanshu-secure-bucket |
| enable_versioning | Enable bucket versioning | true |
| enable_encryption | Enable server-side encryption | true |

## Example: Custom Deployment

```bash
terraform apply -var="aws_region=us-west-2" -var="bucket_base_name=my-custom-bucket"
```

## Security Considerations

This configuration implements AWS best practices for S3 bucket security:

- All public access is blocked
- Server-side encryption is enabled by default
- ACLs are disabled in favor of IAM policies
- Versioning is enabled to protect against accidental deletions

## Additional Resources

- [AWS S3 Documentation](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html)
- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)