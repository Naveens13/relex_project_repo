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
![Architecture image](https://github.com/user-attachments/assets/509b76de-78cc-4348-a21f-f2f228d324bd)

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

## Future Improvements

After creating the initial resources using Terraform, the following improvements can be implemented to enhance the project:

### Environment Separation
- Create separate resources for **staging** and **production** environments using Terraform workspaces or separate configuration files. This ensures isolation between environments and reduces the risk of unintended changes.

### Configuration Management with Ansible
- Use **Ansible** to manage the configuration of EC2 instances after they are provisioned. Ansible can handle tasks like software installation, configuration updates, and service management in a more dynamic and scalable way.

### CI/CD Pipeline with Jenkins
- Integrate **Jenkins** for **Continuous Integration (CI)** and **Continuous Deployment (CD)**. Jenkins can automate the process of testing, building, and deploying infrastructure changes, ensuring faster and more reliable deployments.

### Terraform Modules and Data Sources
- Refactor the Terraform code into reusable **modules** to promote code reusability and maintainability. Use **data sources** to fetch information dynamically (e.g., AMI IDs, VPC details) instead of hardcoding values.

### Secure Credential Management
- Use **HashiCorp Vault** or **AWS Secrets Manager** to securely store and manage sensitive credentials (e.g., API keys, passwords) instead of hardcoding them in Terraform configuration files.

### Containerization with Docker and Kubernetes
- Use **Docker** to containerize applications, making them portable and consistent across different environments. Deploy and manage these containers using **Kubernetes** for orchestration, scaling, and high availability.

### Monitoring and Logging Enhancements
- Expand monitoring and logging capabilities by integrating **Prometheus** and **Grafana** for advanced metrics visualization and alerting. Use **ELK Stack (Elasticsearch, Logstash, Kibana)** for centralized logging and log analysis.

### Infrastructure Testing
- Implement infrastructure testing using tools like **Terratest** or **Kitchen-Terraform** to validate the correctness and reliability of the Terraform code before deployment.

### Cost Optimization
- Use **AWS Cost Explorer** and **Terraform Cost Estimation** tools to analyze and optimize infrastructure costs. Implement auto-scaling and spot instances for cost-effective resource utilization.

### Disaster Recovery and Backup
- Implement **disaster recovery** strategies using **AWS Backup** or Terraform-managed snapshots. Ensure critical data and configurations are regularly backed up and can be restored quickly in case of failures.

