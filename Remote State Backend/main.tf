# Creating S3 Bucket
resource "aws_s3_bucket" "TF_State_Bucket" {
  bucket = "tfstatebucket-233225"

  tags = {
    Name = "TF_State_Bucket"
  }
}

# Enabling Versioning
resource "aws_s3_bucket_versioning" "versioning_TF_state_bucket" {
  bucket = aws_s3_bucket.TF_State_Bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# D
resource "aws_dynamodb_table" "stateLock" {
  name         = "TF-StateLock"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}