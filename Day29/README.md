# Terraform AWS Multi-Component Infrastructure Deployment

This project uses Terraform to deploy a multi-component infrastructure on AWS, including an EC2 instance and an S3 bucket. The Terraform state is stored remotely in an S3 bucket, with DynamoDB handling state locking to prevent concurrent changes.

## Prerequisites

Before you begin, ensure you have the following:

1. **Terraform**: Install Terraform by following the instructions [here](https://www.terraform.io/downloads).
2. **AWS CLI**: Install and configure the AWS CLI with credentials and a default region. You can configure it using:

    ```bash
    aws configure
    ```

3. **AWS Account**: You need access to an AWS account with permissions to create EC2 instances, S3 buckets, and DynamoDB tables.

## Repository Structure

- **main.tf**: Configures the S3 backend and DynamoDB for state management.
- **variables.tf**: Defines the input variables required for the deployment.
- **outputs.tf**: Provides outputs like the EC2 public IP, S3 bucket name, and region.
- **dynamodb.tf**: Creates a DynamoDB table for state locking.
- **s3.tf**: Creates an S3 bucket for storing the Terraform state.
- **modules/infrastructure/**: Contains the custom Terraform module for deploying the EC2 instance and S3 bucket.
  - **main.tf**: Resources for EC2 and S3 within the module.
  - **variables.tf**: Variables specific to the module.
  - **outputs.tf**: Outputs related to the infrastructure deployed by the module.

## Step-by-Step Deployment Guide

### Step 1: Clone the Repository

Clone this repository to your local machine:

```bash
git clone <repository-url>
cd <repository-folder>
```
# Terraform Setup Guide

## Step 2: Set Up S3 Bucket and DynamoDB for State Management

Note: You can either create the S3 bucket and DynamoDB table manually or use Terraform to manage them.

### Create S3 Bucket

1. Modify `s3.tf` to specify a unique bucket name.
2. Run Terraform to create the S3 bucket:
   ```bash
   terraform init
   terraform apply -target=aws_s3_bucket.terraform_state
   ```

Create DynamoDB Table:

Modify dynamodb.tf if needed.
Run Terraform to create the DynamoDB table:

```
terraform apply -target=aws_dynamodb_table.terraform_locks
```

## Step 3: Initialize Terraform and Apply the Configuration

### Initialize Terraform:
Initialize Terraform to download necessary providers and set up the backend:

`terraform init`

Review and Apply the Configuration:

Review the Terraform plan to understand what resources will be created:

`terraform plan`

Apply the configuration to deploy the infrastructure:

`terraform apply`

## Step 4: Verify the Deployment

### After applying the configuration, Terraform will output key information such as:

EC2 Public IP
S3 Bucket Name
Region
Use this information to verify that the EC2 instance and S3 bucket were created successfully.

## Step 5: Testing State Locking

### Open two terminal windows.
In both terminals, run:

`terraform apply`

Verify that DynamoDB locks the state file, preventing concurrent updates.

## Step 6: Modify and Re-Apply Infrastructure

Modify any variable, such as the instance type in variables.tf.
Re-run terraform apply to observe how Terraform manages state changes and applies updates.

## Clean Up
To clean up the resources created by this project, run:

`terraform destroy`

Terraform Functions Used
```
join(): Used to combine strings for resource names.
lookup(): Used to set default values for variables if not provided.
length(): Used to count the number of resources.
```

### License

This project is licensed under the MIT License - see the LICENSE file for details.

## Output:

![image](https://github.com/user-attachments/assets/084c9b75-89a3-4733-b58c-1bc8bc7aa14e)
![image](https://github.com/user-attachments/assets/86993bd0-b8e3-46f3-9f7e-09b79e45d1ce)
![image](https://github.com/user-attachments/assets/4a3fecd6-7422-4410-9148-9aa870914573)
![image](https://github.com/user-attachments/assets/01244286-a29a-41b3-b675-0448e8a88030)
![image](https://github.com/user-attachments/assets/4bc83716-8a49-4d6c-b552-24968701e043)
![image](https://github.com/user-attachments/assets/393a76e8-77ff-44b7-b86c-a1a34fd7cca2)
![image](https://github.com/user-attachments/assets/b5f4854b-6cee-4161-ad21-9bb61606c31d)
![image](https://github.com/user-attachments/assets/3165a0ea-e56a-4879-8df0-93b43aad2765)
![Uploading image.png…]()









