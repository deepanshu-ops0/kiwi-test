variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-unique-bucket-name"
}

variable "enable_versioning" {
  description = "Enable versioning on the S3 bucket"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to the S3 bucket"
  type        = map(string)
  default     = {
    Environment = "dev"
    Terraform   = "true"
  }
}