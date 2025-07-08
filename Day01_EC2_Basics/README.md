# 🚀 Day 01 - Launch EC2 Instance Using Terraform

## 📌 Objective

Provision a basic Amazon EC2 instance using Terraform on AWS.  
This marks the starting point for hands-on learning of Infrastructure as Code (IaC) using Terraform.

---

## 🛠️ Technologies Used

- **Terraform v1.x**
- **AWS CLI** (configured with IAM user access key)
- **Amazon EC2**

---

## 📁 Project Structure

Day01_EC2_Basics/
├── main.tf # EC2 provisioning code
├── .terraform.lock.hcl # Provider version lock file
└── README.md # Project documentation

---

## 🧠 Terraform Concepts Covered

| Concept              | Description                                      |
|----------------------|--------------------------------------------------|
| `provider`           | Specifies AWS as the cloud provider              |
| `resource`           | Defines the AWS EC2 instance                     |
| `terraform init`     | Initializes the Terraform project                |
| `terraform plan`     | Previews the actions Terraform will take         |
| `terraform apply`    | Applies the plan and provisions infrastructure   |
| `terraform destroy`  | Destroys all resources created by Terraform      |

---

## 📜 main.tf (Code Summary)

```hcl
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0d03cb826412c6b0f"   # Amazon Linux 2 AMI (Mumbai region)
  instance_type = "t2.micro"
  tags = {
    Name = "Day1-EC2"
  }
}


🔧 Terraform Commands Used

terraform init
terraform plan
terraform apply


✅ Output
✅ EC2 instance created in ap-south-1 (Mumbai)

✅ AMI: Amazon Linux 2

✅ Instance Type: t2.micro

✅ Tag: Name = Day1-EC2
