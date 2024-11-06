resource "aws_key_pair" "TF_key" {
  key_name   = "TF_key"
  public_key = tls_private_key.TF_key.public_key_openssh
}

resource "tls_private_key" "TF_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "TF_key_pem" {
  content  = tls_private_key.TF_key.private_key_pem
  filename = "tfkey"
}