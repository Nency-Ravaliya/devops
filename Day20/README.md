# Project 01: Ansible Automation

## Overview

This repository provides Ansible configurations for various automation tasks. The project includes dynamic inventory management, performance tuning, debugging and troubleshooting playbooks, and the exploration of advanced modules. 

## Project Directory Structure


## Inventory Plugins

### Activity
Configure a dynamic inventory plugin to manage a growing number of web servers dynamically. Integrate the plugin with Ansible to automatically detect and configure servers in various environments.

### Deliverable
Dynamic inventory configuration file or script that automatically updates the inventory based on real-time server data.

- **File**: `aws_ec2.yml`
- **Description**: This configuration file is used to dynamically manage inventory for AWS EC2 instances. It enables automatic updates based on the current state of your AWS environment.

**[See `aws_ec2.yml` in the repository for configuration details.]**

## Performance Tuning

### Activity
Tune Ansible performance by adjusting settings such as parallel execution (forks), optimizing playbook tasks, and reducing playbook run time.

### Deliverable
Optimized `ansible.cfg` configuration file, performance benchmarks, and documentation detailing the changes made for performance improvement.

- **File**: `ansible.cfg`
- **Description**: Contains optimized settings for parallel execution and other performance enhancements.

**[See `ansible.cfg` in the repository for performance tuning settings.]**

## Debugging and Troubleshooting Playbooks

### Activity
Implement debugging strategies to identify and resolve issues in playbooks, including setting up verbose output and advanced error handling.

### Deliverable
Debugged playbooks with enhanced error handling and logging, including a troubleshooting guide with common issues and solutions.

- **File**: `set_nginx.yml`
- **Description**: A playbook demonstrating debugging strategies, including verbose output and improved error handling.

**[See `set_nginx.yml` in the repository for debugging techniques.]**

## Exploring Advanced Modules

### Activity
Use advanced Ansible modules such as `docker_container` to manage containerized applications and `aws_ec2` for AWS infrastructure management, demonstrating their integration and usage.

### Deliverable
Playbooks showcasing the deployment and management of Docker containers and AWS EC2 instances, along with documentation on the benefits and configurations of these advanced modules.

- **File**: `install_docker.yml`
- **Description**: Demonstrates the use of the `docker_container` module for managing Docker containers.

- **File**: `aws_ec2.yml`
- **Description**: Shows the use of the `aws_ec2` module for managing AWS infrastructure.

**[See `install_docker.yml` and `aws_ec2.yml` in the repository for advanced module usage.]**

## Instructions for Use

1. **Clone the Repository**:
    ```bash
    git clone <repository-url>
    cd <repository-directory>
    ```

2. **Update Inventory**:
    - Configure `aws_ec2.yml` with your AWS settings to enable dynamic inventory management.

3. **Configure `ansible.cfg`**:
    - Adjust settings in `ansible.cfg` for performance optimization according to your environment.

4. **Run Playbooks**:
    - To deploy and manage Docker containers:
      ```bash
      ansible-playbook install_docker.yml
      ```

    - To configure Nginx with debugging enabled:
      ```bash
      ansible-playbook set_nginx.yml -vvv
      ```

5. **Review Documentation**:
    - Refer to the `README.md` and respective YAML files for detailed configuration and usage instructions.

## Additional Notes

- **Dynamic Inventory**: Ensure the `aws_ec2.yml` file is correctly set up to reflect your AWS environment for real-time inventory updates.
- **Performance Tuning**: Review the `ansible.cfg` settings to optimize Ansible performance.
- **Debugging**: Use the verbose output and error handling in `set_nginx.yml` to troubleshoot issues.
- **Advanced Modules**: Explore and customize the provided playbooks to effectively manage Docker containers and AWS resources.

For further details, refer to the corresponding YAML files and configurations in the repository.

## Output:
- ![image](https://github.com/user-attachments/assets/375f6b58-5f8b-4a98-8bfa-4477a07849be)
- ![image](https://github.com/user-attachments/assets/8eca8f88-16c5-4f10-9533-934f7739cccc)
- ![image](https://github.com/user-attachments/assets/1a511cb2-d5a6-4223-bfd7-25f007d530e5)


