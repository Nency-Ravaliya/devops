# AWS CloudFormation Deployment Guide

## Overview

This guide provides a step-by-step process for deploying a VPC, EC2 instance, S3 bucket, and RDS MySQL database using AWS CloudFormation. The CloudFormation template creates and configures the following resources:

- **VPC** with public and private subnets
- **EC2 Instance** for hosting applications
- **S3 Bucket** for storage
- **RDS MySQL Database** for backend data

## Prerequisites

1. **AWS Account**: You need an active AWS account.
2. **Key Pair**: An existing EC2 key pair for SSH access to the EC2 instance.

## CloudFormation Template

The CloudFormation template (`template.yml`) defines the resources and their configurations.

## Deployment Steps

### 1. Access the CloudFormation Console

1. Log in to the [AWS Management Console](https://aws.amazon.com/console/).
2. Navigate to the **CloudFormation** service by searching for **"CloudFormation"** in the Services menu.

### 2. Create a New Stack

1. In the CloudFormation console, click **"Create stack"** and select **"With new resources (standard)"**.

### 3. Upload the Template

1. **Choose Template Source:**
   - Select **"Upload a template file"**.
   - Click **"Choose file"** and upload the `template.yml` file you downloaded from the GitHub repository.

2. Click **"Next"**.

### 4. Configure Stack Details

1. **Specify Stack Name:**
   - Enter a name for your stack (e.g., `MyApplicationStack`).

2. **Configure Parameters:**
   - Provide any necessary parameters required by your template. These might include values such as database username, password, instance types, etc.

3. Click **"Next"**.

### 5. Configure Stack Options

1. **Add Tags:**
   - Optionally, you can add tags to your stack for better organization and management.

2. **Set Permissions:**
   - Choose the appropriate IAM role or permissions to allow CloudFormation to create and manage resources.

3. Click **"Next"**.

### 6. Review and Create

1. **Review Configuration:**
   - Review the settings and ensure all parameters and options are correct.

2. **Create Stack:**
   - Check the box acknowledging that AWS CloudFormation might create IAM resources.
   - Click **"Create stack"**.

### 7. Monitor Stack Creation

1. **Monitor Progress:**
   - After creation starts, you can monitor the progress in the **"Events"** tab of your stack in the CloudFormation console.
   - Wait until the stack status changes to **"CREATE_COMPLETE"**.

### 8. Post-Deployment Steps

1. **Verify Resources:**
   - Check the AWS services that were provisioned as part of the stack, such as RDS instances, Load Balancers, and Auto Scaling Groups.

2. **Access the Application:**
   - If your stack includes an Application Load Balancer, use the DNS name provided to access your application.

3. **Validate Configuration:**
   - Ensure that all resources are configured correctly and are functioning as expected.

## Conclusion

You have successfully deployed your resources using the CloudFormation template. For more detailed management and configuration, refer to the AWS documentation or consult the resources created by the stack.

For any issues or further assistance, please consult the [AWS CloudFormation User Guide](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html) or reach out to AWS Support.

## Output:

![image](https://github.com/user-attachments/assets/21078cb3-ce67-43f9-adc9-7693022bdfb1)
![image](https://github.com/user-attachments/assets/271def1c-0027-4c13-bc2b-97ff7d55a2c2)
![image](https://github.com/user-attachments/assets/49d2fd99-38bc-4226-8746-4f62cd4dfb52)
![image](https://github.com/user-attachments/assets/456f935c-d988-4214-828a-795e3709452b)
![image](https://github.com/user-attachments/assets/53447a25-46e4-413f-9d15-2dd0e69301f4)
![image](https://github.com/user-attachments/assets/8015aa1e-5014-400d-a4e3-c72df321077d)
![image](https://github.com/user-attachments/assets/a6287b38-9c9e-46da-a9da-94b24fdd5e9e)
![image](https://github.com/user-attachments/assets/19a176f3-2a6e-40b5-8d21-27c4aea93be1)
![image](https://github.com/user-attachments/assets/c4d8b47a-aead-46d0-96a6-861785566aed)
![image](https://github.com/user-attachments/assets/0eb7960b-2e3b-420e-a20a-e0177cd6c43c)
![image](https://github.com/user-attachments/assets/b3960ab2-311b-47a6-aae3-37376f96d8b2)













