resource "aws_s3_bucket" "web-bucket" {
  region        = "us-west-2"
  bucket        = "my-cool-website"
  force_destroy = true
  tags = {
    Name = "my-cool-website"
  }
  versioning {
    enabled = true
    mfa_delete = true
  }
  logging {
    target_bucket = "my-log-bucket"
    target_prefix = "log/"
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
      }
    }
  }
  acl           = "private"
}
