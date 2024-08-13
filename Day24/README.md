# S3 Bucket Configuration for Static Website

## Overview

This document provides details on the configuration of the S3 bucket named `techvista-portfolio-[your-initials]`, which hosts a static website. The configuration includes enabling versioning, setting up static website hosting, implementing S3 storage classes, and configuring lifecycle management. It also covers bucket policies and access control lists (ACLs), along with testing and validation.

## Bucket Setup

### 1. Create an S3 Bucket

- **Bucket Name**: `techvista-portfolio-nensi`
- **Region**: [Specify the AWS region you used]

### 2. Enable Versioning

1. Navigate to the **S3 Management Console**.
2. Select the bucket `techvista-portfolio-[your-initials]`.
3. Go to the **Properties** tab.
4. Under **Bucket Versioning**, click **Edit** and enable versioning.

### 3. Set Up Static Website Hosting

1. In the **Properties** tab, scroll to **Static website hosting**.
2. Select **Enable**.
3. For **Index document**, enter `index.html`.
4. Optionally, enter `error.html` for **Error document**.
5. Click **Save changes**.

### 4. Upload Static Website Files

1. Go to the **Objects** tab of the bucket.
2. Click **Upload** and add your static website files (HTML, CSS, images).
3. Click **Upload** to complete the process.

### 5. Verify Website Accessibility

- Access the static website via the S3 website URL: `http://techvista-portfolio-[your-initials].s3-website-[region].amazonaws.com`.

## Implement S3 Storage Classes

### 1. Classify Uploaded Content

- **HTML/CSS Files**: Store in **Standard** for frequent access.
- **Images**: Consider using **Intelligent-Tiering** for automatic cost optimization based on access patterns, or **Glacier** for infrequent access with long-term storage needs.

### 2. Justification

- **Standard**: Best for frequently accessed files like HTML and CSS.
- **Intelligent-Tiering**: Efficient for content with unpredictable access patterns.
- **Glacier**: Suitable for long-term archival of infrequently accessed content.

## Lifecycle Management

### 1. Create Lifecycle Policy

1. Navigate to the **Management** tab of the bucket.
2. Click **Create lifecycle rule**.
3. Name the rule (e.g., `Transition to Glacier`).
4. Define the rule to transition objects older than a specified period (e.g., 30 days) to **Glacier**.
5. Set up another rule to delete non-current versions of objects after 90 days.
6. Save the rule.

### 2. Verify Lifecycle Rules

- Check the **Management** tab to ensure the lifecycle rules are applied correctly.
- Monitor the transitions and deletions as per the rules.

## Configure Bucket Policies and ACLs

### 1. Create Bucket Policy

- **Read Access for Static Website Content**:
  ```json
  {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Effect": "Allow",
              "Principal": "*",
              "Action": "s3:GetObject",
              "Resource": "arn:aws:s3:::techvista-portfolio-[your-initials]/*"
          }
      ]
  }
  
  ```
  # Additionals:
  
  ## Restrict Access to S3 Management Console
  
```
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::techvista-portfolio-[your-initials]/*",
            "Condition": {
                "StringNotEquals": {
                    "aws:username": "specific-iam-user"
                }
            }
        }
    ]
}
```

# website URL: http://techvista-portfolio-nensi.s3-website-us-east-1.amazonaws.com/

## Set Up ACL for Specific Folder Access

- Navigate to the Permissions tab of the bucket.
- Select Access Control List.
- Set permissions for the specific folder to allow access to the external user.

### Images (Standard-IA): "Used Standard-IA for images to balance cost and access frequency, as they are accessed infrequently but need to be available quickly when requested."
### Index.html and CSS, Js(Standard): "Stored index.html and CSS files in Standard for frequent access and optimal performance, ensuring quick loading times for users."
### License and README.md (Glacier Flexible Retrieval): "Placed license and README.md files in Glacier Flexible Retrieval for long-term archival with infrequent access needs, reducing storage costs."

# Test and Validate Configuration

1.**Test Static Website URL**
Ensure the website is accessible via the URL: http://techvista-portfolio-[your-initials].s3-website-[region].amazonaws.com.

2.**Validate Storage Class Transitions**
Check the S3 console to confirm that objects are transitioning to the specified storage classes based on the lifecycle policy.

3.**Check Bucket Policy and ACLs**
Simulate Access Scenarios:
Access content with the static website URL to verify public access.
Test restricted access by attempting to access the S3 management console with unauthorized users.
Validate folder-specific access by using the credentials of the external user.

## Outputs:

![Screenshot from 2024-08-13 15-56-37](https://github.com/user-attachments/assets/6b776fd9-19e5-4501-a4b6-1924d1a1adff)
![Screenshot from 2024-08-13 15-56-46](https://github.com/user-attachments/assets/6feae000-1eca-4737-bc0b-5b3610f0c2b5)
![Screenshot from 2024-08-13 15-57-00](https://github.com/user-attachments/assets/eff59a88-1b97-4ee0-850a-a1f250d8c786)
![Screenshot from 2024-08-13 15-57-11](https://github.com/user-attachments/assets/be545fcf-724a-4067-a1c1-4318c760a559)
![Screenshot from 2024-08-13 15-57-20](https://github.com/user-attachments/assets/5d911020-8b8a-4ae1-aa2e-c8a6df46c93b)
![Screenshot from 2024-08-13 15-57-35](https://github.com/user-attachments/assets/057f0cd0-2209-4555-8c3a-443e303dba60)
![image](https://github.com/user-attachments/assets/66698921-a6bf-4e18-af74-df0427b1ae26)
![image](https://github.com/user-attachments/assets/351c6409-c538-47db-951e-d3fece87dafc)
![image](https://github.com/user-attachments/assets/ef03c9fc-00bb-4137-9bc5-bb53cbc58bc8)










