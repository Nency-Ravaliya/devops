variable "aws_region" {
  description = "The AWS region to deploy resources."
  type        = string
  default     = "us-west-1"
}

variable "instance_type" {
  description = "The type of EC2 instance."
  type        = string
  default     = "t2.micro"
}

variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
}
