# iVolve CI/CD Infrastructure Project

![Architecture Diagram](./docs/assets/architecture-diagram.png)

## Table of Contents
1. [Project Overview](#project-overview)
2. [System Architecture](#system-architecture)
3. [Infrastructure Components](#infrastructure-components)
4. [Getting Started](#getting-started)
5. [Detailed Documentation](#detailed-documentation)
6. [Project Structure](#project-structure)
7. [Troubleshooting](#troubleshooting)
8. [Contributing](#contributing)

## Project Overview
This project implements a complete CI/CD pipeline for the iVolve web application, featuring:
- Terraform-provisioned AWS infrastructure
- Jenkins-based build automation
- ArgoCD for GitOps deployments
- Local Kubernetes development environment

## System Architecture

### AWS Infrastructure (Terraform Provisioned)
| Component               | Description                                                                 |
|-------------------------|-----------------------------------------------------------------------------|
| **EC2 Instance 1 (Master)** | Hosts Jenkins Master and SonarQube, configured via Ansible                  |
| **EC2 Instance 2 (Slave)**  | Dedicated Jenkins Slave for build execution, Ansible-configured             |
| **Supporting Services**     | S3 for Terraform state, CloudWatch for monitoring                           |

### Local Development Environment
- Minikube cluster with dedicated "iVolve" namespace
- Manages Deployments, Services, and Ingress resources

### ArgoCD Implementation
| Component          | Functionality                                                      |
|--------------------|--------------------------------------------------------------------|
| Application Controller | Manages application state and sync operations                     |
| Repository Server  | Maintains cached application repositories                          |
| API Server         | Provides RESTful interface for operations                          |
| GitOps Engine      | Handles Git-to-Kubernetes synchronization                          |

## Infrastructure Components

### 1. AWS Setup
```bash
terraform/aws/
├── main.tf          # Primary infrastructure configuration
├── variables.tf     # Variable definitions
└── outputs.tf       # Output values
```

### 2. Jenkins Configuration
```bash
jenkins/
├── Jenkinsfile      # Pipeline definition
├── ansible/         # Configuration playbooks
└── slave-config/    # Slave node setup
```

### 3. ArgoCD Setup
```bash
argocd/
├── applications/    # Application manifests
├── config/          # ArgoCD configuration
└── bootstrap/       # Initial setup scripts
```

### 4. Local Kubernetes
```bash
kubernetes/
├── manifests/       # Deployment files
├── minikube/        # Local cluster config
└── helm/            # Optional Helm charts
```

## Getting Started

### Prerequisites
- AWS account with EC2 permissions
- Terraform v1.0+
- Ansible 2.9+
- Minikube v1.20+

### Initial Setup
1. Provision AWS infrastructure:
   ```bash
   cd terraform/aws
   terraform init
   terraform apply
   ```

2. Configure Jenkins:
   ```bash
   ansible-playbook jenkins/ansible/master-setup.yml
   ```

3. Deploy ArgoCD:
   ```bash
   kubectl apply -n argocd -f argocd/bootstrap/install.yaml
   ```

## Detailed Documentation
- [AWS Infrastructure Guide](./docs/aws-guide.md)
- [Jenkins Pipeline Walkthrough](./docs/jenkins-pipeline.md)
- [ArgoCD Configuration](./docs/argocd-config.md)
- [Local Development Setup](./docs/local-dev.md)

## Project Structure
```
ivolve-cicd/
├── terraform/       # Infrastructure as Code
├── jenkins/         # CI Pipeline Configuration
├── argocd/          # GitOps Deployment
├── kubernetes/      # Cluster Manifests
├── docs/            # Detailed Documentation
│   ├── assets/      # Diagrams and images
│   └── *.md        # Component guides
└── README.md        # This document
```