resource "aws_security_group" "TF_SG" {
  name        = "All Traffic"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = "vpc-0671aeda10b05ebd9"

  tags = {
    Name = "Terraform_SG"
  }
}

# Ingress rule to allow HTTPS traffic on port 443
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_443" {
  security_group_id = aws_security_group.TF_SG.id
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"
  description = "Allow HTTPS traffic"
}

# Ingress rule to allow HTTP traffic on port 80
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_80" {
  security_group_id = aws_security_group.TF_SG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  description       = "Allow HTTP traffic"
}

# Ingress rule to allow SSH traffic on port 22
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_ssh" {
  security_group_id = aws_security_group.TF_SG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  description       = "Allow SSH traffic"
}

# Egress rule to allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.TF_SG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # allows all traffic (equivalent to all ports and protocols)
  description       = "Allow all outbound traffic"
}
