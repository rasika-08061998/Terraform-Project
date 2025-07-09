# 🚀 Day 02 - Launch EC2 with Variables and Outputs using Terraform

## 📌 Objective

Refactor Terraform code to use **input variables**, **outputs**, and **clean structure** for provisioning an EC2 instance on AWS.

This makes the code **dynamic**, **modular**, and ready for **multi-environment use** (dev/stage/prod).

---

## 🛠️ Technologies Used

- **Terraform v1.x**
- **AWS CLI**
- **Amazon EC2**

---

## 📁 Project Structure
Day02_TerraformVariables/
├── main.tf # Main configuration using variables
├── variables.tf # Input variable declarations
├── outputs.tf # Output declarations
├── terraform.tfvars # Optional file with actual input values
└── README.md # Documentation


---

## 🧠 Terraform Concepts Covered

| Concept             | Description                                                                            |
|---------------------|----------------------------------------------------------------------------------------|
| `variable`          | Allows code to be reused with dynamic inputs                                           |
| `output`            | Prints useful information after deployment                                             |
| `terraform.tfvars`  | External file to assign values to variables                                            |
| `terraform init`    | Initializes the Terraform project                                                      |
| `terraform plan`    | Shows what Terraform will do before it makes any changes                              |
| `terraform apply`   | Deploys infrastructure                                                                 |
| `terraform destroy` | Destroys infrastructure created by Terraform                                           |

---

## 📜 Code Summary

### 🔧 `main.tf`

```hcl
provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "my_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
📥 variables.tf

variable "aws_region" {
  description = "AWS region to deploy the instance"
  type        = string
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0d03cb826412c6b0f"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Tag name for the EC2 instance"
  type        = string
  default     = "Day2-EC2"
}

📤 outputs.tf
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.my_ec2.id
}

output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.my_ec2.public_ip
}

🗂️ terraform.tfvars (optional)

aws_region     = "ap-south-1"
ami_id         = "ami-0d03cb826412c6b0f"
instance_type  = "t2.micro"
instance_name  = "Day2-EC2-FromTFVars"

🔧 Terraform Commands

terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
terraform destroy -var-file="terraform.tfvars"

✅ Expected Output
EC2 instance created in Mumbai region (ap-south-1)

Instance type: t2.micro

Tag: Day2-EC2-FromTFVars (from .tfvars)

Console will display:

EC2 instance ID

EC2 public IP
