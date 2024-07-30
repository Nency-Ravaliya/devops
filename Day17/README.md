# Ansible Deployment in a Multi-Node Environment

## Prerequisites
- **Control Node**: Linux-based OS (e.g., Ubuntu, CentOS), SSH access with administrative privileges.
- **Managed Nodes**: Linux-based OS (e.g., Ubuntu, CentOS), SSH access with administrative privileges.
- **Software**: Ansible installed on the control node, Python installed on both control and managed nodes.
- **Networking**: Control node must be able to reach managed nodes over SSH (port 22).

## Steps

1. **Control Node Setup**
   - **Install Ansible**: 
     ```bash
     sudo apt update
     sudo apt install ansible
     ```
   - **Configure SSH Key-Based Authentication**:
     ```bash
     ssh-keygen -t rsa -b 4096
     ssh-copy-id -i ~/.ssh/id_rsa.pub user@managed-node-ip
     ```
     Replace `user@managed-node-ip` with the actual username and IP address of the managed node.

2. **Managed Nodes Configuration**
   - **Ensure Python is Installed**:
     ```bash
     sudo apt install python3
     ```

3. **Verification**
   - **Create Inventory File**:
     Create `inventory.ini`:
     ```ini
     [managed_nodes]
     managed-node-ip ansible_user=user
     ```
   - **Test Ansible Connectivity**:
     ```bash
     ansible all -m ping -i inventory.ini
     ```

4. **Troubleshooting**
   - **SSH Authentication Failure**: Verify SSH key is added to managed nodes. Check SSH key permissions: `chmod 600 ~/.ssh/id_rsa`.
   - **Connectivity Issues**: Ensure network connectivity and firewall settings. Verify SSH service is running on managed nodes.
   - **Permission Errors**: Ensure Ansible user has appropriate permissions. 
   - **Missing Python**: Install Python on all managed nodes.

For further assistance, refer to the [Ansible documentation](https://docs.ansible.com/ansible/latest/index.html).


====================================

# Ansible Ad-Hoc Commands for Task Execution

## Prerequisites
- **Control Node**: Ansible installed and configured with access to managed nodes.
- **Managed Nodes**: Accessible over SSH, Python installed.

## Task Execution

1. **Check Disk Usage Across All Managed Nodes**
   - **Command**: 
     ```bash
     ansible all -m command -a "df -h" -b
     ```
   - **Description**: This command checks disk usage on all managed nodes and provides human-readable output (`-h` flag for `df`).

2. **Restart a Specific Service on All Managed Nodes**
   - **Command**: 
     ```bash
     ansible all -m service -a "name=nginx state=restarted" -b
     ```
   - **Description**: This command restarts the `nginx` service on all managed nodes. Ensure `nginx` is installed and configured on the managed nodes.

3. **Update All Packages on a Subset of Managed Nodes**
   - **Command**: 
     ```bash
     ansible all -m apt -a "upgrade=dist update_cache=yes" -b
     ```
   - **Description**: This command updates all packages to their latest version on the managed nodes using `apt`. The `-b` flag is used to execute commands with sudo privileges.

## Command Scripts and Documentation

1. **Disk Usage Check Script**
   - **Command**:
     ```bash
     ansible all -m command -a "df -h" -b
     ```
   - **Output**: 
     Displays disk usage in human-readable format across all managed nodes.

2. **Service Restart Script**
   - **Command**:
     ```bash
     ansible all -m service -a "name=nginx state=restarted" -b
     ```
   - **Output**: 
     Restarts the `nginx` service. Ensure to check the service status and logs if any issues arise.

3. **Package Update Script**
   - **Command**:
     ```bash
     ansible all -m apt -a "upgrade=dist update_cache=yes" -b
     ```
   - **Output**: 
     Updates all installed packages to the latest version. Review the update results for any potential issues or errors.

=========================================================







