# Terraform AWS Key Pair Project

This project demonstrates how to use **Terraform** to create an **AWS EC2 key pair** and securely save the private key locally. The key pair can be used to SSH into AWS EC2 instances.

---

## **Project Overview**

- **Terraform** is used as the Infrastructure-as-Code (IaC) tool.
- A **TLS provider** generates a private key locally.
- The **AWS key pair** is created using the generated public key.
- The **private key** is stored securely on the local filesystem for SSH access.

---

## **Terraform Resources Used**

### 1. AWS Provider

provider "aws" {
  region = "us-east-1"
}


**2. TLS Private Key**
resource "tls_private_key" "devops_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}


Generates an RSA private key locally for AWS key pair creation.

**3. AWS Key Pair**
resource "aws_key_pair" "devops_kp" {
  key_name   = "devops-kp"
  public_key = tls_private_key.devops_key.public_key_openssh
}
Creates a key pair in AWS using the generated public key.

**4. Save Private Key Locally**
resource "local_file" "private_key" {
  content         = tls_private_key.devops_key.private_key_pem
  filename        = "/home/bob/devops-kp.pem"
  file_permission = "0600"
}
Saves the private key locally with secure permissions.

**Workflow Diagram**
             +----------------+
             | TLS Private Key |
             +--------+-------+
                      |
                      v
             +----------------+
             | AWS Key Pair   |
             | (Public Key)   |
             +--------+-------+
                      |
                      v
             +----------------+
             | Local File     |
             | /home/bob/devops-kp.pem |
             +----------------+


**Explanation**:

TLS Private Key: Generated locally by Terraform.

AWS Key Pair: Public key uploaded to AWS EC2.

Local File: Private key stored for SSH access.


**Outcome**:

AWS Key Pair named devops-kp is created.
Private key is saved at /home/bob/devops-kp.pem.
Key permissions are secure (0600) for SSH login.

**Skills Demonstrated** :

Terraform (IaC)
AWS EC2 Key Pair Management
TLS Key Generation
Automation of Secure Key Storage
