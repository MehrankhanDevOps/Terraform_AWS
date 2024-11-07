


resource "aws_instance" "ec2" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.micro"
  tags = {
    Name = "EC2_TF"
  }
  depends_on = [
    aws_s3_bucket.testbuckets3
  ]
}

resource "aws_s3_bucket" "testbuckets3" {
  bucket = "mmkbucket334"

  tags = {
    Name = "Testing"
  }
}