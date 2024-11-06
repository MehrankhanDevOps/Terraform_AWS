provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "TF_VPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "TF_VPC"
  }
}

resource "aws_subnet" "Public_Subnet" {
  vpc_id     = aws_vpc.TF_VPC.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "Public_Subnet"
  }
}

resource "aws_subnet" "Private_Subnet" {
  vpc_id     = aws_vpc.TF_VPC.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "Private_Subnet"
  }
}

resource "aws_internet_gateway" "TF_Internet_gatway" {
  vpc_id = aws_vpc.TF_VPC.id
}

resource "aws_route_table" "TF_Route_Table" {
  vpc_id = aws_vpc.TF_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.TF_Internet_gatway.id
  }
  tags = {
    Name = "TF_Route_Table"
  }
}

resource "aws_route_table_association" "TF_route_table_association" {
  subnet_id      = aws_subnet.Public_Subnet.id
  route_table_id = aws_route_table.TF_Route_Table.id
}