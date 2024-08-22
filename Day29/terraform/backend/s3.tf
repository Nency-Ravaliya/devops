resource "aws_s3_bucket" "state" {
  bucket = "nency-terraform-bucket"
  acl    = "private"
}

output "bucket_name" {
  value = aws_s3_bucket.state.bucket
}
