variable "instance_Name1" {
  type = map(string)
  default = {
    "dev" = "Dev"
    "staging" = "Staging"
    "prod" = "Production"
  }
}

variable "instance_type1" {
    type = map(string)
    default = {
        "dev" = "t2.micro"
        "staging" = "t2.small"
        "prod" = "t2.medium"
    }
}

variable "instance_ami1" {
    default = "ami-005fc0f236362e99f"  
}