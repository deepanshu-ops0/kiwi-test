variable "aws_region" {
  description = "The AWS region to deploy the S3 bucket"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the bucket"
  type        = map(string)
  default     = {}
}

variable "enable_versioning" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
  default     = true
}

variable "enable_lifecycle_rules" {
  description = "Enable lifecycle rules for the S3 bucket"
  type        = bool
  default     = false
}

variable "standard_ia_transition_days" {
  description = "Number of days before transitioning objects to STANDARD_IA storage"
  type        = number
  default     = 30
}

variable "glacier_transition_days" {
  description = "Number of days before transitioning objects to GLACIER storage (0 to disable)"
  type        = number
  default     = 60
}

variable "expiration_days" {
  description = "Number of days before expiring objects (0 to disable)"
  type        = number
  default     = 0
}