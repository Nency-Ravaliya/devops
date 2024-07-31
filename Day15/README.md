# CI/CD Pipeline for Java Application

This repository provides a complete setup for a CI/CD pipeline using Jenkins to automate the deployment of a simple Java application. The pipeline includes the following tasks:
1. Fetch the Dockerfile from a GitHub repository.
2. Create a Docker image from the Dockerfile.
3. Push the Docker image to DockerHub.
4. Deploy the container using the pushed Docker image.

## Deliverables

### 1. GitHub Repository
The GitHub repository contains:
- The source code of a simple Java application.
- A `Dockerfile` for building the Docker image.

### 2. Jenkins Pipeline Script
A `Jenkinsfile` that:
- Clones the GitHub repository.
- Builds the Docker image.
- Pushes the Docker image to DockerHub.
- Deploys a container using the pushed image.

### 3. DockerHub Repository
A DockerHub repository where the Docker images will be stored.

### 4. Jenkins Setup
Ensure Jenkins is installed and configured on a local Ubuntu machine with the following plugins:
- Git
- Docker
- Pipeline

### 5. Documentation
This document provides detailed instructions on setting up the local Jenkins environment, configuring the pipeline, and verifying the deployment.

## Jenkins Setup

### 1. Install Jenkins on Ubuntu
Follow these steps to install Jenkins:
```bash
sudo apt update
sudo apt install openjdk-11-jdk
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins
```

Configure Jenkins:

```bash
sudo systemctl start jenkins
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
```


