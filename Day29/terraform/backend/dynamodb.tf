resource "aws_dynamodb_table" "state_lock" {
  name         = "nency-terraform-state-lock"
  billing_mode  = "PAY_PER_REQUEST"
  hash_key      = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "nency-terraform-state-lock"
  }
}
