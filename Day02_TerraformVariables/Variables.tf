variable "aws_region" {
    description = "AWS region to deploy the instance"
    type = string
    default = "ap-south-1"
}

variable "ami_id" {
  default = "ami-0d03cb826412c6b0f"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_name" {
  default = "Day2-EC2"
}
