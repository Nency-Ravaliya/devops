resource "aws_instance" "example" {
  ami           = "ami-0ecaad63ed3668fca"  # Replace with a valid AMI ID for your region
  instance_type = var.instance_type

  tags = {
    Name = join("-", [var.instance_prefix, "instance"])
  }

  vpc_security_group_ids = [aws_security_group.sg.id]
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name = join("-", [var.bucket_prefix, "bucket"])
  }
}

resource "aws_security_group" "sg" {
  name_prefix = "allow_ssh"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "ec2_public_ip" {
  description = "The public IP address of the EC2 instance."
  value       = aws_instance.example.public_ip
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket created."
  value       = aws_s3_bucket.bucket.bucket
}
