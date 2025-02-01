# Creation of EC2 Web Server Using Infrastructure as a Code (IaC) - Terraform

This Terraform project provisions an EC2 instance in AWS, configures it as a web server, and sets up monitoring and CI workflows.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Resources Created](#resources-created)
- [Setup Instructions](#setup-instructions)
- [CI Workflow](#ci-workflow)
- [Monitoring](#monitoring)
- [Outputs](#outputs)
- [Destroy](#destr0y)
- [Future Improvements](#future-improvements)

---

## Overview

This project uses Terraform to:

- Provision an EC2 instance in AWS.
- Configure the instance as a web server serving a simple HTML page.
- Set up security groups to allow HTTP (port 80) and SSH (port 22) traffic.
- Enable CloudWatch monitoring for CPU and memory utilization.
- Automate the deployment process using GitHub Actions.

---

## Prerequisites

Before using this project, ensure you have the following:

1. **AWS Account**: An AWS account with Free Tier eligibility.
2. **Terraform Installed**: Terraform installed on your local machine. Download it from [here](https://www.terraform.io/downloads.html).
3. **AWS CLI**: AWS CLI configured with your credentials. Follow the [AWS CLI setup guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html).
4. **GitHub Account**: A GitHub account for CI workflows.

---

## Resources Created

This Terraform configuration creates the following resources in AWS:

- **EC2 Instance**: A `t2.micro` instance running Amazon Linux.
- **Security Group**: Allows HTTP (port 80) and SSH (port 22) traffic.
- **CloudWatch Alarms**: Monitors CPU and memory utilization.
- **Web Server**: Apache web server serving a simple "Hello, World!" page.

---

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/Naveens13/relex_project_repo
cd relex_project_repo
```

### 2. Initialize Terraform

Run the following command to initialize Terraform and download the required providers:

```bash
terraform init
```

### 3. Apply the Terraform Configuration

Apply the Terraform configuration to create the resources:

```bash
terraform apply -auto-approve
```

### 4. Access the Web Server

Once the EC2 instance is provisioned, Terraform will output the public IP address of the instance. Open a web browser and navigate to:

```bash
http://<your-ec2-public-ip>
```

---

## CI Workflow

This project includes a GitHub Actions workflow to automate Terraform code validation. The workflow:

1. **Lints the Terraform code** using `terraform fmt -check` to ensure consistent formatting.
2. **Validates the Terraform configuration** using `terraform validate` to check for syntax errors.
3. **Applies the configuration automatically** when changes are pushed to the `main` branch.

### Workflow Steps:

- **Checkout Repository**: Pulls the latest code from the repository.
- **Set Up Terraform**: Installs the specified version of Terraform.
- **Terraform Format Check**: Runs `terraform fmt -check` to ensure the code is properly formatted.
- **Terraform Init**: Initializes the Terraform working directory.
- **Terraform Validate**: Validates the Terraform configuration for syntax errors.
- **Terraform Apply**: Applies the Terraform configuration automatically (only on the `main` branch).

---

## Monitoring

CloudWatch monitoring is enabled for the EC2 instance to track CPU and memory utilization. You can view the metrics in the AWS Management Console under **CloudWatch → Metrics**.

### CloudWatch Alarms

- **High CPU Utilization**: Triggers if CPU utilization exceeds 50% for 2 consecutive evaluation periods.

---

## Outputs

After applying the Terraform configuration, the following outputs are displayed:

- **Instance ID**: The ID of the EC2 instance.
- **Public IP**: The public IP address of the EC2 instance.
- **Security Group ID**: The ID of the security group created for the instance.

To view the outputs, run:

```bash
terraform output
```

## Destroy

After creating the web server you can destroy the whole configuration using a single command

To destroy aws resources, run:

```bash
terraform destroy
```
