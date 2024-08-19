# ShopMax E-commerce Platform Deployment

This project involves deploying a scalable, secure, and highly available e-commerce platform for "ShopMax" in preparation for a major sales event. The deployment includes setting up a custom VPC, configuring S3 for static content, launching and configuring EC2 instances and RDS, and implementing load balancing and auto-scaling. The infrastructure is designed to handle fluctuating web traffic while ensuring data security and cost-effectiveness.

## Project Steps and Deliverables

### 1. VPC Design and Implementation (90 minutes)

#### 1.1 Design a Custom VPC
1. **Create a VPC:**
   - Go to the [VPC Dashboard](https://console.aws.amazon.com/vpc/home).
   - Click on "Create VPC."
   - Choose "VPC only" and provide a name (e.g., `ShopMax-VPC`).
   - Configure IPv4 CIDR block (e.g., `10.0.0.0/16`).
   - Click "Create VPC."

2. **Create Subnets:**
   - Navigate to the "Subnets" section in the VPC Dashboard.
   - Click "Create subnet."
   - Create two public subnets:
     - Provide a name (e.g., `Public-Subnet-1`), select the VPC, and assign an IPv4 CIDR block (e.g., `10.0.1.0/24`).
     - Repeat for the second public subnet with a different CIDR block (e.g., `10.0.2.0/24`).
   - Create two private subnets:
     - Provide a name (e.g., `Private-Subnet-1`), select the VPC, and assign an IPv4 CIDR block (e.g., `10.0.3.0/24`).
     - Repeat for the second private subnet with a different CIDR block (e.g., `10.0.4.0/24`).

3. **Set Up an Internet Gateway:**
   - Go to the "Internet Gateways" section.
   - Click "Create Internet Gateway," name it (e.g., `ShopMax-IGW`), and click "Create."
   - Attach the Internet Gateway to your VPC.

4. **Configure Routing Tables:**
   - Navigate to the "Route Tables" section.
   - Create a new route table and associate it with the public subnets.
   - Add a route to the Internet Gateway (e.g., `0.0.0.0/0` to `ShopMax-IGW`).
   - Associate the private subnets with a different route table without an Internet Gateway.

#### 1.2 Security Configuration
1. **Create Security Groups:**
   - Go to the "Security Groups" section in the VPC Dashboard.
   - Create security groups for EC2 instances, Load Balancer, and RDS.
   - Configure inbound and outbound rules based on your security requirements.

2. **Implement Network ACLs:**
   - Go to the "Network ACLs" section.
   - Create a new ACL and associate it with the subnets.
   - Define inbound and outbound rules for additional security.

---

### 2. S3 Bucket Configuration for Static Content (45 minutes)

#### 2.1 Create and Configure S3 Buckets
1. **Create an S3 Bucket:**
   - Go to the [S3 Dashboard](https://console.aws.amazon.com/s3/home).
   - Click "Create bucket."
   - Name the bucket `shopmax-static-content-[your-initials]`, select a region, and click "Create."

2. **Set Bucket Policies:**
   - Click on the bucket name, go to the "Permissions" tab.
   - Edit the bucket policy to allow public read access to static content. Use the following policy:
     ```json
     {
       "Version": "2012-10-17",
       "Statement": [
         {
           "Effect": "Allow",
           "Principal": "*",
           "Action": "s3:GetObject",
           "Resource": "arn:aws:s3:::shopmax-static-content-[your-initials]/*"
         }
       ]
     }
     ```

3. **Enable Versioning and Logging:**
   - Go to the "Properties" tab of the bucket.
   - Enable versioning.
   - Enable logging and choose a target bucket for storing access logs.

#### 2.2 Optimize Content Delivery (Optional)
1. **Set Up an S3 Bucket for Backups:**
   - Create another bucket for backups or archival.
   - Configure lifecycle rules to transition objects to Glacier.

---

### 3. EC2 Instance Setup and Web Server Configuration (60 minutes)

#### 3.1 Launch EC2 Instances
1. **Launch EC2 Instances:**
   - Go to the [EC2 Dashboard](https://console.aws.amazon.com/ec2/v2/home).
   - Click "Launch Instance."
   - Choose "Amazon Linux 2 AMI" and select `t2.micro` instance type.
   - Configure network settings to use the public subnets.
   - Review and launch the instances.

2. **SSH into Instances:**
   - Connect to your EC2 instances via SSH using the key pair you specified during instance launch.

3. **Install Web Server:**
   - For Apache:
     ```bash
     sudo yum update -y
     sudo yum install -y httpd
     sudo systemctl start httpd
     sudo systemctl enable httpd
     ```
   - For Nginx:
     ```bash
     sudo amazon-linux-extras install -y nginx1
     sudo systemctl start nginx
     sudo systemctl enable nginx
     ```

#### 3.2 Deploy the Application
1. **Clone and Deploy Node.js Application:**
   - SSH into each instance and clone the Node.js application repository:
     ```bash
     git clone <your-repo-url>
     cd <your-repo-folder>
     npm install
     npm start
     ```

2. **Configure Web Server:**
   - For Apache, configure virtual hosts or modify `httpd.conf`.
   - For Nginx, configure server blocks or modify `nginx.conf`.
   - Ensure the web server is set to serve both dynamic content from the Node.js application and static content from S3.

---

### 4. RDS Setup and Database Configuration (60 minutes)

#### 4.1 Provision an RDS MySQL Instance
1. **Launch an RDS Instance:**
   - Go to the [RDS Dashboard](https://console.aws.amazon.com/rds/home).
   - Click "Create database."
   - Choose "MySQL" and select the Free Tier template (`t3.micro`).
   - Launch the instance in the private subnets and configure database settings.

2. **Configure the Database Schema:**
   - Use a MySQL client to connect to your RDS instance and set up the schema:
     ```sql
     CREATE TABLE users (...);
     CREATE TABLE orders (...);
     CREATE TABLE products (...);
     ```

3. **Set Up Automated Backups:**
   - In the RDS dashboard, configure automated backups for high availability.

#### 4.2 Database Security
1. **Encrypt Data:**
   - Ensure encryption at rest and in transit is enabled for your RDS instance.

2. **Restrict Database Access:**
   - Update security group rules to restrict access to the RDS instance from EC2 instances only.

---

### 5. Load Balancer and Auto Scaling Configuration (90 minutes)

#### 5.1 Set Up an Application Load Balancer (ALB)
1. **Deploy an ALB:**
   - Go to the [EC2 Dashboard](https://console.aws.amazon.com/ec2/v2/home) and select "Load Balancers."
   - Click "Create Load Balancer," choose "Application Load Balancer."
   - Configure listeners and select public subnets.
   - Create a target group and register the EC2 instances.

2. **Configure Health Checks:**
   - Set up health checks for the target group to ensure instances are healthy.

#### 5.2 Configure Auto Scaling
1. **Create an Auto Scaling Group:**
   - Go to the [EC2 Dashboard](https://console.aws.amazon.com/ec2/v2/home) and select "Auto Scaling Groups."
   - Click "Create Auto Scaling Group."
   - Configure the group to use the public subnets and set desired, minimum, and maximum instances (`Desired: 2, Minimum: 1, Maximum: 2`).
   - Define scaling policies based on CPU utilization.

2. **Test the Setup:**
   - Simulate traffic and verify that the ALB distributes traffic evenly.
   - Ensure the Auto Scaling group adjusts the number of instances based on demand.

---

### 6. Testing, Validation, and Optimization (60 minutes)

#### 6.1 Full Application Test
1. **Access the Application:**
   - Use the ALB DNS name to access the e-commerce application.
   - Ensure both static and dynamic content is served correctly.

2. **Validate Database Connections:**
   - Test database connections and transactions (e.g., creating orders, adding products).

3. **Test Security Configurations:**
   - Attempt to access restricted resources and ensure proper logging of unauthorized access attempts.

#### 6.2 Optimization
1. **Review Architecture:**
   - Analyze the architecture for potential optimizations.
   - Suggest improvements for response time, cost reduction, and enhanced security.

---

## Conclusion
By following these steps, you will have deployed a scalable and secure e-commerce platform capable of handling high traffic during major sales events. The infrastructure is designed for high availability, fault tolerance, and cost efficiency, ensuring that "ShopMax" can provide a seamless shopping experience for its customers.

