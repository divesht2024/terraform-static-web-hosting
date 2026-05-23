# Static Website Hosting on AWS using Terraform

This project automates the deployment of a static website on AWS using Terraform. It creates and configures an S3 bucket for static website hosting with public access settings.

---

# 🚀 Project Overview

This Terraform project helps you:

- Create an AWS S3 Bucket
- Enable Static Website Hosting
- Configure Public Access
- Upload Static Website Files
- Host HTML/CSS/JS Website on AWS
- Automate Infrastructure using Terraform

---

# 🛠️ Technologies Used

- Terraform
- AWS S3
- AWS CLI
- HTML/CSS/JS

---

# 📁 Project Structure

```bash
static-website-hosting-terraform/
│
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── website/
│   ├── index.html
│   ├── style.css
│   └── script.js
│
└── README.md
```

---

# ⚙️ Prerequisites

Before starting, ensure you have:

- AWS Account
- Terraform Installed
- AWS CLI Installed
- IAM User with S3 Permissions

---

# 🔑 Configure AWS CLI

```bash
aws configure
```

Provide:

```bash
AWS Access Key ID
AWS Secret Access Key
Default Region
Output Format
```

---

# 📌 Terraform Commands

## 1. Initialize Terraform

```bash
terraform init
```

## 2. Validate Configuration

```bash
terraform validate
```

## 3. Preview Infrastructure

```bash
terraform plan
```

## 4. Deploy Infrastructure

```bash
terraform apply
```

Type:

```bash
yes
```

## 5. Destroy Infrastructure

```bash
terraform destroy
```

---

# 🌐 AWS Resources Created

- S3 Bucket
- Bucket Policy
- Static Website Hosting Configuration
- Public Access Configuration

---

# 📤 Upload Website Files

```bash
aws s3 cp website/ s3://your-bucket-name/ --recursive
```

---

# 🔗 Access Website

After deployment, Terraform will provide the website endpoint URL.

Example:

```bash
http://bucket-name.s3-website-ap-south-1.amazonaws.com
```

---

# 📸 Architecture

```text
User Browser
      ↓
AWS S3 Static Website Hosting
      ↓
HTML / CSS / JS Files
```

---

# 💡 Key Learning Outcomes

- Infrastructure as Code (IaC)
- AWS S3 Static Website Hosting
- Terraform Resource Management
- AWS Public Bucket Policies
- Cloud Infrastructure Automation

---

# 📚 Terraform Resources Used

- aws_s3_bucket
- aws_s3_bucket_policy
- aws_s3_bucket_website_configuration
- aws_s3_bucket_public_access_block

---

# 🧹 Cleanup

To avoid unnecessary AWS charges:

```bash
terraform destroy
```

---

# 👨‍💻 Author

Terraform AWS Infrastructure Automation Project
