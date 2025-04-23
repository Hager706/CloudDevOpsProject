## 🏗️ Architecture Overview

![Architecture Diagram](./docs/architecture-diagram.png) <!-- You can create this image and place it inside `docs/` -->

The system is divided into three major areas:
- **AWS Infrastructure**: Provisioned using Terraform to create Jenkins Master/Slave EC2 instances and supporting services like S3 and CloudWatch.
- **Local Development Environment**: A Minikube Kubernetes cluster running containerized applications.
- **ArgoCD GitOps Deployment**: Automatically synchronizes application manifests from GitHub to Kubernetes.

---

## 🛠️ Components

### ☁️ AWS Infrastructure (Terraform Provisioned)
- **EC2 Instance 1 (Master)**:
  - Jenkins Master
  - SonarQube Server
  - Configured with Ansible
- **EC2 Instance 2 (Slave)**:
  - Jenkins Slave for executing pipeline jobs
  - Configured with Ansible
- **Supporting Services**:
  - S3 bucket for Terraform state
  - CloudWatch for monitoring and logging

### 💻 Local Development (Minikube Cluster)
- Kubernetes cluster hosting the containerized application
- Resources under a dedicated `iVolve` namespace

### 📦 ArgoCD Deployment
- GitOps-based deployment mechanism
- Monitors GitHub for changes and syncs to Minikube automatically

---

## 🧰 Prerequisites

- AWS Account with permissions to create EC2, S3, and CloudWatch resources
- Terraform installed
- Ansible installed
- Docker installed
- Minikube installed
- kubectl installed
- ArgoCD CLI installed
- GitHub repository to store your application code and Kubernetes manifests

---

## ⚡ Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/your-repo.git
   cd your-repo
   ```

2. Provision AWS Infrastructure:
   ```bash
   cd terraform
   terraform init
   terraform apply
   ```

3. Configure EC2 Instances:
   ```bash
   cd ansible
   ansible-playbook master-setup.yml
   ansible-playbook slave-setup.yml
   ```

4. Deploy ArgoCD to Minikube:
   ```bash
   cd argocd
   kubectl apply -f install.yaml
   ```

5. Connect ArgoCD to your GitHub repository:
   ```bash
   argocd app create ivolve-app --repo https://github.com/your-username/your-repo.git --path k8s-manifests --dest-server https://kubernetes.default.svc --dest-namespace ivolve
   argocd app sync ivolve-app
   ```

6. Push your code changes, and watch your pipeline automatically build and deploy your application!

---

## 🔄 CI/CD Pipeline Flow

1. Developer pushes code to GitHub.
2. Jenkins Master detects changes and triggers the pipeline.
3. Jenkins Slave runs:
   - ✅ Unit tests
   - ✅ SonarQube analysis
   - ✅ JAR file build
   - ✅ Docker image build and push
   - ✅ Kubernetes manifests update
   - ✅ GitHub commit
4. ArgoCD detects updated manifests.
5. ArgoCD syncs changes into the Minikube cluster.
6. 🚀 Application is deployed/updated automatically.

---

## 📁 Project Structure

```
/terraform         -> Terraform scripts for AWS infrastructure
/ansible           -> Ansible playbooks for EC2 configuration
/jenkins           -> Jenkins pipelines and configurations
/argocd            -> ArgoCD setup files and application definitions
/k8s-manifests     -> Kubernetes deployment manifests
/docs              -> Detailed documentation and diagrams
README.md          -> This file
```

---

## 📚 Detailed Documentation

- [AWS Setup](./docs/aws-setup.md)
- [Jenkins Configuration](./docs/jenkins-setup.md)
- [ArgoCD Setup](./docs/argocd-setup.md)
- [Local Development (Minikube)](./docs/local-development.md)

