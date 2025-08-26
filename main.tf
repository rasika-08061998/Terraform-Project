provider "aws" {
  region = "ap-south-1"  # Change region if needed
}

resource "tls_private_key" "devops_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "devops_kp" {
  key_name   = "devops-kp"
  public_key = tls_private_key.devops_key.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.devops_key.private_key_pem
  filename = "/home/rasika/devops-kp.pem"
  file_permission = "0600"
}