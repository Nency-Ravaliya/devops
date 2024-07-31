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

Jenkins Pipeline Configuration

### 1. Create a Jenkins Pipeline Job
Open Jenkins and click New Item.
Enter a name for the pipeline job and select Pipeline.
Click OK to create the job.

### 2. Configure Pipeline Script

In the job configuration:

Scroll to the Pipeline section.
Select Pipeline script and enter the following script:


## Configure DockerHub Credentials

Go to Manage Jenkins > Manage Credentials > (global).
Click Add Credentials and select Username with password.
Enter your DockerHub username and password.
Use the ID you provide as DOCKER_CREDENTIALS_ID in the Jenkinsfile.
DockerHub Repository Setup
### 1. Create a DockerHub Account
If you don’t already have a DockerHub account, create one at DockerHub.

### 2. Create a DockerHub Repository
Log in to DockerHub and create a new repository to store your Docker images.

Verifying the Deployment
### 1. Trigger the Pipeline Job
In Jenkins, navigate to your pipeline job and click Build Now.

### 2. Monitor the Build Process
Check the console output for each stage of the pipeline to ensure all steps execute successfully.

### 3. Verify Container Deployment
Access the application at **http://localhost:8080** or use docker ps to list running containers to ensure the container is running correctly.


