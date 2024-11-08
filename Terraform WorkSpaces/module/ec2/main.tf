resource "aws_instance" "EC2" {
  ami = variable.instance_ami
  instance_type = variable.instance_type
  tags = {
    Name = variable.instance_Name
  }
}