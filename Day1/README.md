﻿### <a name="_pkt714xzpk31"></a>**Comprehensive Linux Operations**
#### <a name="_65of7ssrciix"></a>**Project Overview**
This project spans various aspects of Linux system administration, including file management, user and group management, service control, process handling, and more. You will be completing tasks that simulate real-world scenarios, providing hands-on experience with Linux commands and configurations.
### <a name="_y9vv0q3kjfaw"></a>**Project Breakdown**
#### <a name="_utnth48bvqij"></a>**Part 1: Creating and Editing Text Files (20 minutes)**
**Scenario:** You are tasked with documenting the configurations and settings for a new server. You'll use different text editors to create and update these documents.

1. **Using Nano**

Create a file server\_config.txt using Nano:

nano server\_config.txt

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.001.png)

Add the following content:

Server Name: WebServer01

IP Address: 192.168.1.100

OS: Ubuntu 20.04

1. Save and exit (Ctrl+O, Enter, Ctrl+X).
1. **Using Vi**

Edit the same file with Vi:

vi server\_config.txt

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.002.png)

Append the following text:

Installed Packages: Apache, MySQL, PHP

1. Save and exit (Esc, :wq).
1. **Using Vim**

Further edit the file with Vim:

vim server\_config.txt

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.003.png)

Add the following text:

Configuration Complete: Yes

1. Save and exit (Esc, :wq).
#### <a name="_c6mmwlig0kga"></a>**Part 2: User & Group Management (20 minutes)**
**Scenario:** You need to set up user accounts and groups for a new team joining the project.

1. **Adding/Removing Users**

**Add a new user developer:**

sudo adduser developer

![ref1]

**Remove the user developer:**

sudo deluser developer

![ref1]

1. **Managing Groups**

**Create a group devteam:**

sudo groupadd devteam

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.005.png)

**Add the user developer to the devteam group:**

sudo usermod -aG devteam developer

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.006.png)

**Remove the user developer from the devteam group:**

sudo gpasswd -d developer devteam

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.007.png)

#### <a name="_6371f4k4jzmj"></a>**Part 3: File Permissions Management (20 minutes)**
**Scenario:** Ensure that only the appropriate users have access to specific files and directories.

1. **Understanding File Permissions**

View permissions for server\_config.txt:

ls -l server\_config.txt

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.008.png)

1. Discuss the output (e.g., -rw-r--r--).
1. **Changing Permissions and Ownership**

Change permissions to read/write for the owner and read-only for others:

chmod 644 server\_config.txt

![ref2]

Verify the change:

ls -l server\_config.txt

Change the owner to developer and the group to devteam:

sudo chown developer:devteam server\_config.txt

Verify the change:

ls -l server\_config.txt

![ref3]

#### <a name="_idl5kovermok"></a>**Part 4: Controlling Services and Daemons (20 minutes)**
**Scenario:** Manage the web server service to ensure it is running correctly and starts on boot.

1. **Managing Services with systemctl**

Start the Apache service:

sudo systemctl start apache2

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.011.png)

Stop the Apache service:

sudo systemctl stop apache2

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.012.png)

Enable the Apache service to start on boot:

sudo systemctl enable apache2

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.013.png)

Disable the Apache service:

sudo systemctl disable apache2

![ref4]

Check the status of the Apache service:

sudo systemctl status apache2

![ref4]

1. **Understanding Daemons**
   1. Discuss the role of the sshd daemon in providing SSH access to the server.
#### <a name="_h6sjqyetmqax"></a>**Part 5: Process Handling (20 minutes)**
**Scenario:** Monitor and manage processes to ensure the server is performing optimally.

1. **Viewing Processes**

List all running processes:

ps aux

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.015.png)

Use top to view processes in real-time:

top

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.016.png)

1. **Managing Processes**

Identify a process to kill using ps or top, then kill it:

kill <PID>

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.017.png)

Change the priority of a process (e.g., running sleep with a lower priority):

nice -n 10 sleep 100 &

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.018.png)


Change the priority of the process using renice:

renice +10 <PID>

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.019.png)

### <a name="_5g7gldyox9g4"></a>**Creating and Deploying a Static Website with Apache2**
#### <a name="_vvakelssuj5f"></a>**Preparation (5 minutes)**
- Ensure you have access to a Linux environment (e.g., virtual machines, EC2 instances, or local installations) with sudo privileges.
### <a name="_rwgkc42i3s1"></a>**Activity Breakdown**
#### <a name="_wbakvhm0k2wk"></a>**Part 1: Installing Apache2 (5 minutes)**
1. **Update Package Lists**

Open the terminal and run:

sudo apt update

1. **Install Apache2**

Install Apache2 by running:

sudo apt install apache2

1. **Start and Enable Apache2**

Start the Apache2 service:

sudo systemctl start apache2

Enable Apache2 to start on boot:

sudo systemctl enable apache2

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.020.png)

1. **Verify Installation**
   1. Open a web browser and navigate to http://your\_server\_ip. You should see the Apache2 default page.

      ![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.021.png)
#### <a name="_agiuof3yu2db"></a>**Part 2: Creating the Website (10 minutes)**
1. **Navigate to the Web Directory**

Change to the web root directory:

cd /var/www/html

1. **Create a New Directory for the Website**

Create a directory named mystaticwebsite:

sudo mkdir mystaticwebsite

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.022.png)

Change ownership of the directory:

sudo chown -R $USER:$USER /var/www/html/mystaticwebsite

1. **Create HTML File**

Create and edit the index.html file:

nano /var/www/html/mystaticwebsite/index.html

Add the following content:

<!DOCTYPE html>

<html>

<head>

`  `<title>My Static Website</title>

`  `<link rel="stylesheet" type="text/css" href="styles.css">

</head>

<body>

`  `<h1>Welcome to My Static Website</h1>

`  `<p>This is a simple static website using Apache2.</p>

`  `<script src="script.js"></script>

</body>

</html>

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.023.png)

1. Save and exit (Ctrl+O, Enter, Ctrl+X).
1. **Create CSS File**

Create and edit the styles.css file:

nano /var/www/html/mystaticwebsite/styles.css

Add the following content:

body {

`  `font-family: Arial, sans-serif;

`  `background-color: #f0f0f0;

`  `text-align: center;

`  `margin: 0;

`  `padding: 20px;

}

h1 {

`  `color: #333;

}

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.024.png)

1. Save and exit (Ctrl+O, Enter, Ctrl+X).
1. **Create JavaScript File**

Create and edit the script.js file:

nano /var/www/html/mystaticwebsite/script.js



Add the following content:

document.addEventListener('DOMContentLoaded', function() {

`  `console.log('Hello, World!');

});

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.025.png)

1. Save and exit (Ctrl+O, Enter, Ctrl+X).
1. **Add an Image**

Download or copy an image file (e.g., logo.png) to the website directory:

cp /path/to/your/logo.png /var/www/html/mystaticwebsite/logo.png

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.026.png)

Update index.html to include the image:

<body>

`  `<h1>Welcome to My Static Website</h1>

`  `<img src="logo.png" alt="Logo">

`  `<p>This is a simple static website using Apache2.</p>

`  `<script src="script.js"></script>

</body>

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.027.png)

#### <a name="_zbq1soq37pps"></a>**Part 3: Configuring Apache2 to Serve the Website (10 minutes)**
1. **Create a Virtual Host File**

Create and edit the virtual host configuration file:

sudo nano /etc/apache2/sites-available/mystaticwebsite.conf

Add the following content:

<VirtualHost \*:80>

`  `ServerAdmin webmaster@localhost

`  `DocumentRoot /var/www/html/mystaticwebsite

`  `ErrorLog ${APACHE\_LOG\_DIR}/error.log

`  `CustomLog ${APACHE\_LOG\_DIR}/access.log combined

</VirtualHost>

1. Save and exit (Ctrl+O, Enter, Ctrl+X).
1. **Enable the New Virtual Host**

Enable the virtual host configuration:

sudo a2ensite mystaticwebsite.conf

1. **Disable the Default Site**

Disable the default site configuration:

sudo a2dissite 000-default.conf

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.028.png)

1. **Reload Apache2**

Reload the Apache2 service to apply the changes:

sudo systemctl reload apache2

![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.029.png)

1. **Test the Configuration**
   1. Open a web browser and navigate to http://your\_server\_ip. You should see the static website with the HTML, CSS, JS, and image.

      ![](Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.030.png)


[ref1]: Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.004.png
[ref2]: Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.009.png
[ref3]: Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.010.png
[ref4]: Aspose.Words.2e32810f-c131-4c7a-a162-965b3bbb2e64.014.png
