# AWS S3 Bucket Terraform Module

This module creates an AWS S3 bucket with configurable options for versioning, encryption, lifecycle rules, and public access blocking.

## Features

- S3 bucket creation with custom naming
- Versioning (enabled by default)
- Server-side encryption with AES256
- Public access blocking (enabled by default)
- Configurable lifecycle rules for transitioning objects to different storage classes
- Object expiration policies
- Resource tagging

## Usage

```terraform
module "s3_bucket" {
  source = "./path/to/module"

  bucket_name = "my-unique-bucket-name"
  
  # Optional configurations
  aws_region             = "us-west-2"
  enable_versioning      = true
  enable_lifecycle_rules = true
  
  tags = {
    Environment = "Production"
    Project     = "MyProject"
  }
}
```

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws_region | The AWS region to create resources in | `string` | `"us-east-1"` | no |
| bucket_name | Name of the S3 bucket | `string` | `"deepanshu-22-july-bucket"` | yes |
| tags | A map of tags to add to the S3 bucket | `map(string)` | `{ Environment = "Dev", Project = "Example", Terraform = "true" }` | no |
| enable_versioning | Enable versioning on the S3 bucket | `bool` | `true` | no |
| enable_lifecycle_rules | Enable lifecycle rules for the S3 bucket | `bool` | `false` | no |
| standard_ia_transition_days | Days after which to transition objects to STANDARD_IA | `number` | `30` | no |
| enable_glacier_transition | Enable transition to Glacier storage class | `bool` | `false` | no |
| glacier_transition_days | Days after which to transition objects to GLACIER | `number` | `90` | no |
| expiration_days | Days after which to expire objects | `number` | `365` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | The name of the bucket |
| bucket_arn | The ARN of the bucket |
| bucket_domain_name | The bucket domain name |
| bucket_regional_domain_name | The bucket region-specific domain name |

## Notes

- The bucket name must be globally unique across all AWS accounts
- By default, all public access is blocked
- Server-side encryption with AES256 is enabled by default
- Versioning is enabled by default

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | ~> 4.0 |