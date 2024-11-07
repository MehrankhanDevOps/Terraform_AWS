resource "aws_instance" "EC2" {
  ami           = var.Insatnce_ami
  instance_type = var.Insatnce_type
  tags = {
    Name = var.Instance_tag
  }
}
