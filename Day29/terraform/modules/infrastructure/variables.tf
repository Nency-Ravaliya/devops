variable "instance_type" {
  description = "The type of EC2 instance."
  type        = string
  default     = "t2.micro"
}

variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
}

variable "aws_region" {
  description = "The AWS region to deploy resources."
  type        = string
}

variable "instance_prefix" {
  description = "Prefix for the EC2 instance name."
  type        = string
  default     = "myapp"
}

variable "bucket_prefix" {
  description = "Prefix for the S3 bucket name."
  type        = string
  default     = "myapp"
}

variable "additional_tags" {
  description = "Additional tags to apply to resources."
  type        = map(string)
  default     = {}
}
