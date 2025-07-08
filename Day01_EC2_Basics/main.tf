provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0d03cb826412c6b0f"   # Amazon Linux 2 AMI (update region-wise)
  instance_type = "t2.micro"
  tags = {
    Name = "Day1-EC2"
  }
}
