# 🚀 AWS 3-Tier Architecture using Terraform

\<p align="center">
&#x20; \<img src="[https://img.shields.io/badge/AWS-Cloud%20Infrastructure-orange?style=for-the-badge&logo=amazonaws&logoColor=white](https://img.shields.io/badge/AWS-Cloud%20Infrastructure-orange?style=for-the-badge\&logo=amazonaws\&logoColor=white)" />
&#x20; \<img src="[https://img.shields.io/badge/Terraform-Infrastructure%20as%20Code-7B42BC?style=for-the-badge&logo=terraform&logoColor=white](https://img.shields.io/badge/Terraform-Infrastructure%20as%20Code-7B42BC?style=for-the-badge\&logo=terraform\&logoColor=white)" />
&#x20; \<img src="[https://img.shields.io/badge/Architecture-3--Tier-blue?style=for-the-badge](https://img.shields.io/badge/Architecture-3--Tier-blue?style=for-the-badge)" />
&#x20; \<img src="[https://img.shields.io/badge/Region-ap--south--1-yellow?style=for-the-badge](https://img.shields.io/badge/Region-ap--south--1-yellow?style=for-the-badge)" />
\</p>

\<p align="center">
&#x20; \<b>🏗️ Building Scalable, Highly Available & Secure AWS Infrastructure with Terraform Modules\</b>
\</p>

---

## 🌟 Project Overview

This project demonstrates the implementation of a **3-Tier Architecture on AWS using Terraform (Infrastructure as Code)**.

The infrastructure is designed using a modular approach, separating the application into three independent layers: Web Tier, Application Tier, and Database Tier.

Terraform modules are used to create and manage AWS resources in a reusable, scalable, and organized way.

🎯 **Main Objective:** Automate the deployment of production-style AWS infrastructure using Terraform and implement secure communication between different application tiers.

## 🏛️ Architecture

```text
                    🌐 INTERNET
                         |
                         |
                  ⚖️ Application
                   Load Balancer
                         |
              ┌──────────┴──────────┐
              |                     |
        🌍 Public Subnet       🌍 Public Subnet
          AZ: ap-south-1a        AZ: ap-south-1b
              |                     |
          🖥️ Web EC2             🖥️ Web EC2
              |                     |
              └──────────┬──────────┘
                         |
                   🔒 Private Network
                         |
                 ⚙️ Application Tier
                         |
              ┌──────────┴──────────┐
              |                     |
        🔐 Private Subnet      🔐 Private Subnet
              |                     |
          🖥️ App EC2             🖥️ App EC2
              |                     |
              └──────────┬──────────┘
                         |
                    🗄️ Database Tier
                         |
                   Amazon RDS
                    MySQL 8.4
                    Multi-AZ
                         |
                 🔒 Private DB Subnets
```

## ☁️ AWS Services Used

| Service                   | Purpose                                 |
| ------------------------- | --------------------------------------- |
| Amazon VPC                | Isolated cloud network                  |
| Public Subnets            | Host web tier resources                 |
| Private Subnets           | Host application and database resources |
| Availability Zones        | High availability across AZs            |
| EC2                       | Compute instances                       |
| Application Load Balancer | Distribute incoming web traffic         |
| Auto Scaling Group        | Automatically manage EC2 capacity       |
| Amazon RDS                | Managed MySQL database                  |
| Security Groups           | Network-level access control            |
| Amazon S3                 | Remote Terraform state storage          |
| IAM                       | AWS identity and access management      |

## 🧩 Terraform Modules

This project follows a modular Terraform structure.

| Module    | Responsibility                      |
| --------- | ----------------------------------- |
| `network` | VPC, Subnets and Security Groups    |
| `web`     | Web Tier, EC2, ALB and Auto Scaling |
| `app`     | Application Tier and Auto Scaling   |
| `db`      | RDS MySQL Database                  |

### 📂 Project Structure

```text
Terraform-3-Tier-Project/
│
├── 📁 modules/
│   │
│   ├── 📁 network/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── 📁 web/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── 📁 app/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── 📁 db/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── backend.tf
├── main.tf
├── variables.tf
├── terraform.tfvars.example
├── outputs.tf
├── .gitignore
└── README.md
```

## ✨ Key Features

- 🏗️ Modular Terraform architecture.
- 🌐 Custom VPC with public and private subnets.
- 🌍 Multi-AZ infrastructure across two Availability Zones.
- ⚖️ Application Load Balancer for web traffic distribution.
- 🔄 Auto Scaling Groups for web and application tiers.
- 🔐 Network isolation using private subnets and Security Groups.
- 🗄️ Amazon RDS MySQL with Multi-AZ configuration.
- 📦 Remote Terraform state management using Amazon S3.
- 🔒 State encryption and S3 state locking using lockfile.
- ♻️ Reusable Terraform modules.
- ⚙️ Infrastructure provisioning through Terraform.

## 🛠️ Prerequisites

Before deploying this project, make sure you have:

- AWS Account
- AWS CLI installed and configured
- Terraform installed
- IAM permissions to create the required AWS resources
- An S3 bucket created for remote Terraform state

## 🚀 Deployment Guide

### Step 1: Clone Repository

```bash
git clone https://github.com/abhisheksaste31-source/Terraform-3-Tire_Infro-Project.git

cd Terraform-3-Tire_Infro-Project
```

### Step 2: Configure AWS Credentials

```bash
aws configure
```

Provide your AWS Access Key, Secret Key and default region.

### Step 3: Configure Terraform Variables

Create your own variable file:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Update the required values in `terraform.tfvars`.

⚠️ Never commit real passwords, access keys or sensitive credentials to GitHub.

### Step 4: Initialize Terraform

```bash
terraform init
```

This downloads the required Terraform providers and initializes the S3 backend.

### Step 5: Validate Configuration

```bash
terraform validate
```

### Step 6: Review Execution Plan

```bash
terraform plan
```

### Step 7: Deploy Infrastructure

```bash
terraform apply
```

Type `yes` to approve the infrastructure deployment.

### Step 8: Check Terraform Outputs

```bash
terraform output
```

The project exposes outputs such as:

- 🌐 Web Application Load Balancer DNS
- 🗄️ RDS Database Endpoint

## 🧹 Infrastructure Cleanup

To delete the infrastructure created by Terraform:

```bash
terraform destroy
```

Type `yes` to confirm.

⚠️ Make sure you understand the impact before destroying resources. Back up important data and check your RDS deletion settings.

## 🔐 Security Best Practices

- Never hardcode AWS credentials.
- Store sensitive values securely.
- Keep database resources in private subnets.
- Restrict Security Group inbound rules.
- Enable encryption for remote Terraform state.
- Use IAM roles and least-privilege permissions.
- Never commit `.terraform/` or Terraform state files.
- Enable appropriate database backups and deletion protection.

## 🎓 What I Learned

Through this hands-on project, I gained practical experience in:

- AWS 3-Tier Architecture implementation.
- Terraform modules and module communication.
- Terraform variables, outputs and data flow.
- AWS networking and subnet design.
- EC2, ALB and Auto Scaling.
- RDS Multi-AZ configuration.
- Terraform S3 remote backend.
- Infrastructure automation and cloud best practices.

## 🔮 Future Improvements

- Integrate CI/CD using GitHub Actions.
- Implement monitoring using Amazon CloudWatch.
- Add HTTPS using ACM certificates.
- Improve infrastructure security with AWS Secrets Manager.
- Implement automated infrastructure testing.

## 👨‍💻 Author

**DevOps & Cloud Enthusiast**

💡 Passionate about AWS, Terraform, Kubernetes, Docker and Cloud Automation.

## ⭐ Support

If you find this project useful, please consider giving it a ⭐ on GitHub.

Your support motivates me to build and share more Cloud & DevOps projects!

---

\<p align="center">   \<b>🚀 Learn • Build • Automate • Deploy\</b> \</p>

\<p align="center">   Made with ❤️ and Terraform \</p>
