provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "EC2" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.micro"
  key_name = "test1"
  security_groups = [aws_security_group.TF_SG.name]


  tags = {
    Name = "Test Tera"
  }
  user_data = file("${path.module}/userdata_script.sh")

}

resource "aws_instance" "EC22" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.micro"
  key_name = "TF_key"
  security_groups = [aws_security_group.TF_SG.name]


  tags = {
    Name = "Test Tera2"
  }

}


