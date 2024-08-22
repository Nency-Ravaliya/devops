output "ec2_public_ip" {
  description = "The public IP address of the EC2 instance."
  value       = module.infrastructure.ec2_public_ip
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket created."
  value       = module.infrastructure.s3_bucket_name
}

output "region" {
  description = "The AWS region where the resources were deployed."
  value       = var.aws_region
}
