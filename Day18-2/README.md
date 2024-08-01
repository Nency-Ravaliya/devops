# Application Deployment and Configuration

## Overview

This repository contains the playbooks and configurations necessary for setting up a PostgreSQL database and a web server using Nginx. The playbooks are designed to automate the installation and configuration processes on separate servers for database and application deployment.

## Project Structure

- **`playbooks/`**: Contains the Ansible playbooks for provisioning and configuring servers.
  - **`install_postgresql.yml`**: Playbook for installing and configuring PostgreSQL on the database server.
  - **`setup_web_server.yml`**: Playbook for setting up Nginx and deploying the web application on the application server.

- **`templates/`**: Contains Jinja2 template files used for configuration.
  - **`app_config.php.j2`**: Jinja2 template for generating the `app_config.php` file.

- **`files/`**: Contains static files to be deployed.
  - **`index.html`**: The HTML file to be served by Nginx.

- **`vars/`**: Contains variables files for different environments or configurations (if applicable).

## Prerequisites

1. **Ansible**: Ensure Ansible is installed on your local machine or control node. Refer to the Ansible [installation guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) for detailed instructions.

2. **SSH Access**: Ensure you have SSH access to the target servers with appropriate keys configured.

3. **Target Servers**: You should have two target servers:
   - **Database Server**: For PostgreSQL installation.
   - **Application Server**: For Nginx setup and application deployment.

## Configuration

1. **Inventory File**: Update the `hosts` file with the appropriate IP addresses and SSH details for the `database` and `application` servers.

2. **Variables**: Update the variable values in the playbooks or create variable files in the `vars/` directory as needed. Ensure that sensitive information like passwords is managed securely.

## Usage

1. **Install and Configure PostgreSQL**:
   - Run the PostgreSQL installation playbook using:
     ```bash
     ansible-playbook -i hosts install_postgresql.yml
     ```

2. **Set Up Web Server and Deploy Application**:
   - Run the web server setup playbook using:
     ```bash
     ansible-playbook -i hosts setup_web_server.yml
     ```

## Troubleshooting

- **Nginx Not Serving Content**: Ensure that Nginx is running and check the configuration with `nginx -t`. Verify that the files are in the correct location and have appropriate permissions.

- **Database Connection Issues**: Verify that PostgreSQL is running and accessible from the application server. Check the PostgreSQL logs for any errors.

## Additional Notes

- **Security**: Ensure that your servers are secured and that sensitive data is handled appropriately.

- **Customization**: You can customize the playbooks and templates as needed to fit your specific requirements.
