variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "deepanshu-22-july-bucket"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    Environment = "Dev"
    Terraform   = "True"
    Project     = "S3 Bucket Example"
  }
}

variable "enable_versioning" {
  description = "Enable versioning on the S3 bucket"
  type        = bool
  default     = true
}

variable "enable_lifecycle_rules" {
  description = "Enable lifecycle rules for S3 objects"
  type        = bool
  default     = false
}

variable "standard_ia_transition_days" {
  description = "Number of days after which to transition objects to STANDARD_IA storage"
  type        = number
  default     = 30
}

variable "enable_glacier_transition" {
  description = "Enable transition to Glacier storage"
  type        = bool
  default     = false
}

variable "glacier_transition_days" {
  description = "Number of days after which to transition objects to Glacier storage"
  type        = number
  default     = 90
}

variable "enable_expiration" {
  description = "Enable expiration of objects"
  type        = bool
  default     = false
}

variable "expiration_days" {
  description = "Number of days after which objects should expire"
  type        = number
  default     = 365
}