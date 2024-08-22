provider "aws" {
  region = var.aws_region
}

module "infrastructure" {
  source = "./modules/infrastructure"

  instance_type = var.instance_type
  bucket_name   = var.bucket_name
  aws_region    = var.aws_region
}
