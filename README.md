
# AWS ECS Fargate Application Deployment with Terraform

## Project Overview

This project demonstrates how to deploy a containerized web application on AWS ECS Fargate using Terraform.

The infrastructure is provisioned using Terraform, the application is containerized using Docker, the Docker image is stored in Amazon ECR, and the application is exposed to the internet through an Application Load Balancer.

The project uses a modular Terraform structure to create and manage the AWS infrastructure as Code. 

Step 1 — README file location

VS Code mein project open karo:

aws-ecs-project/
│
├── README.md        ← yahan
├── .gitignore
├── app/
├── scripts/
└── terraform/

## Technologies Used

- AWS
- Terraform
- Docker
- Amazon ECR
- Amazon ECS
- AWS Fargate
- Application Load Balancer (ALB)
- VPC
- Public and Private Subnets
- Security Groups
- IAM
- Internet Gateway
- NAT Gateway
- Route Tables
- CloudWatch

- ## Architecture

The application follows this architecture:

```text
                         Internet
                            |
                            v
                +----------------------+
                | Application Load     |
                | Balancer (ALB)       |
                +----------+-----------+
                           |
                           v
                +----------------------+
                | Target Group         |
                +----------+-----------+
                           |
                           v
                +----------------------+
                | ECS Fargate Service  |
                |                      |
                | ECS Tasks            |
                | Docker Container     |
                +----------+-----------+
                           |
                           v
                +----------------------+
                | Amazon ECR           |
                | Docker Image         |
                +----------------------+

                     AWS VPC
        +-----------------------------------+
        |                                   |
        | Public Subnets                    |
        |       |                           |
        |       +---- ALB                   |
        |                                   |
        | Private Subnets                   |
        |       |                           |
        |       +---- ECS Fargate Tasks     |
        |                                   |
        +-----------------------------------+


---

## Step 5 — Project structure

Ab apna actual folder structure add karo:

```markdown
## Project Structure

```text
aws-ecs-project/
│
├── README.md
├── .gitignore
│
├── app/
│   ├── Dockerfile
│   ├── index.html
│   ├── task-definition.json
│   ├── task-definition-clean.json
│   └── task-definition-final.json
│
├── scripts/
│   ├── build.sh
│   └── push-ecr.sh
│
└── terraform/
    │
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    ├── terraform.tfvars
    ├── .terraform.lock.hcl
    │
    ├── provider/
    │   └── main.tf
    │
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── subnets/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── networking/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── security-group/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── ecr/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── iam/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── output.tf
    │
    ├── alb/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    └── ecs/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf


---

## Step 6 — Application Dockerization

```markdown
## Dockerization

The web application is containerized using Docker.

The Dockerfile uses Rocky Linux 9 as the base image.

### Build Docker Image

From the `app` directory:

```bash
docker build -t aws-ecs-project:latest .

---

## Step 7 — Terraform Infrastructure

```markdown
## Infrastructure with Terraform

Terraform is used to provision the AWS infrastructure.

The infrastructure is divided into reusable Terraform modules.

### Terraform Modules

- VPC
- Subnets
- Networking
- Security Groups
- ECR
- IAM
- ALB
- ECS

Step 8 — Terraform commands
## Terraform Deployment


Navigate to the Terraform directory:


```bash
cd terraform

Initialize Terraform:

terraform init

Format the Terraform configuration:

terraform fmt -recursive

Validate the configuration:

terraform validate

Create an execution plan:

terraform plan

Apply the infrastructure:

terraform apply

To destroy the infrastructure:

terraform destroy


---


## Step 9 — AWS deployment flow


```markdown
## Deployment Flow


The deployment process is:


```text
Application
     |
     v
Dockerfile
     |
     v
Docker Image
     |
     v
Amazon ECR
     |
     v
ECS Task Definition
     |
     v
ECS Fargate Service
     |
     v
Application Load Balancer
     |
     v
Internet


---


## Step 10 — Networking


```markdown
## AWS Networking


The project uses a custom VPC with:


- One VPC
- Two public subnets
- Two private subnets
- Internet Gateway
- NAT Gateway
- Public Route Table
- Private Route Table


The Application Load Balancer is deployed in the public subnets.


The ECS Fargate tasks are deployed in the private subnets.
Step 11 — Security
## Security


Separate Security Groups are used for the ALB and ECS tasks.


### ALB Security Group


Allows HTTP traffic from the internet.


```text
Internet
   |
   | HTTP :80
   v
ALB
ECS Security Group

Allows application traffic from the ALB to the ECS tasks.

ALB
 |
 | HTTP :80
 v
ECS Tasks

IAM roles are also configured for ECS task execution and task permissions.



---


## Step 12 — Result


End mein:


```markdown
## Result


The application was successfully deployed on Amazon ECS Fargate.


The final architecture includes:


- Docker container
- Amazon ECR
- ECS Fargate
- Application Load Balancer
- VPC
- Public and Private Subnets
- Security Groups
- IAM Roles
- NAT Gateway
- Internet Gateway


Terraform successfully provisioned the infrastructure using Infrastructure as Code.


Terraform deployment result:


```text
Apply complete!
Resources: 27 added, 0 changed, 0 destroyed.


---


## Step 13 — Important Security Note


README ke end mein ye zaroor rakho:


```markdown
## Security Note


Do not commit the following files or credentials to GitHub:


- AWS Access Keys
- AWS Secret Keys
- Terraform state files
- Terraform variable files containing secrets
- `.env` files
- Private keys


Sensitive information should be stored securely using environment variables, GitHub Secrets, AWS IAM roles, or other secret-management solutions.
Step 14 — GitHub par README update

Aapko professional README nazar aayega:

Project → Architecture → Technologies → Folder Structure → Docker → Terraform → AWS Networking → Security 
