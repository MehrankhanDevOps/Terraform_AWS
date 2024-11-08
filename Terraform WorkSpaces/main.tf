provider "aws" {
  region = "us-east-1"
}

module "EC2" {
    source = "./module/ec2"
    instance_ami = lookup(var.instance_ami1, terraform.workspace, nill)
    instance_Name = lookup(var.instance_Name1, terraform.workspace, Error)
    instance_type = lookup(var.instance_type1, terraform.workspace, Error)
}