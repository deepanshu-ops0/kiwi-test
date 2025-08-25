# AWS S3 Bucket Terraform Module

This module creates an AWS S3 bucket with standard security configurations.

## Features

- Creates an S3 bucket with customizable name
- Configures bucket versioning (enabled by default)
- Sets up server-side encryption with AES256
- Blocks all public access to the bucket
- Applies custom tags

## Usage

```hcl
module "s3_bucket" {
  source = "./s3_bucket"

  bucket_name      = "my-unique-bucket-name"
  enable_versioning = true
  
  tags = {
    Environment = "production"
    Project     = "my-project"
  }
}
```

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `aws_region` | The AWS region to create resources in | `string` | `"us-east-1"` | no |
| `bucket_name` | Name of the S3 bucket | `string` | `"my-unique-bucket-name"` | yes |
| `enable_versioning` | Enable versioning on the S3 bucket | `bool` | `true` | no |
| `tags` | A map of tags to add to the S3 bucket | `map(string)` | `{ Environment = "dev", Terraform = "true" }` | no |

## Outputs

| Name | Description |
|------|-------------|
| `bucket_id` | The ID of the S3 bucket |
| `bucket_arn` | The ARN of the S3 bucket |
| `bucket_domain_name` | The domain name of the S3 bucket |
| `bucket_regional_domain_name` | The regional domain name of the S3 bucket |

## Security Considerations

This module implements the following security best practices:

- Server-side encryption using AES256
- All public access is blocked
- Versioning is enabled by default

## Notes

- Remember to use a globally unique bucket name
- S3 bucket names must be all lowercase and cannot contain spaces