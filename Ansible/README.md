# Jenkins Infrastructure Configuration with Ansible

This repository contains Ansible roles and playbooks for configuring Jenkins infrastructure on AWS EC2 instances provisioned with Terraform.

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform infrastructure deployed (see Terraform directory)
- Python 3.x and pip
- Ansible 2.9+ installed

## Installation

1. Install required Python packages:

```bash
pip install ansible boto3 botocore
```

2. Ensure that the EC2 key pair (`jenkins-key.pem`) is available and has the correct permissions:

```bash
chmod 400 ~/jenkins-key.pem
```

## Directory Structure

- `ansible.cfg`: Ansible configuration file
- `inventory/`: Dynamic inventory configuration for AWS
- `roles/`: Ansible roles for different components
- `playbooks/`: Ansible playbooks for different node types

## Usage

### Verifying Dynamic Inventory

```bash
ansible-inventory --graph
```

This should show your EC2 instances grouped as jenkins_master and jenkins_slave.

### Running Playbooks

To configure all instances:

```bash
ansible-playbook playbooks/site.yml
```

To configure only master or slave nodes:

```bash
ansible-playbook playbooks/master.yml
ansible-playbook playbooks/slave.yml
```

### Verifying Installation

After running the playbooks, you can access:

- Jenkins: http://<master_public_ip>:8080
  - Username: admin
  - Password: admin123 (or as configured in group_vars)

- SonarQube: http://<master_public_ip>:9000
  - Default credentials: admin/admin

## Components Installed

### On Master Node
- Java 11
- Git, Docker, and other common tools
- Jenkins with pre-installed plugins
- SonarQube with PostgreSQL database

### On Slave Node
- Java 11
- Git, Docker, and other common tools
- Jenkins agent configured to connect to master

## Customization

To customize the installation, edit the files in `inventory/group_vars/` directory.