# System Monitoring and Reporting Script
##
### "This script collects system metrics, performs health checks, parses recent log entries, and can be run in both interactive and non-interactive modes. It also supports automated scheduling via cron jobs and sends alerts based on defined thresholds."

## Prerequisites

Bash Shell: Ensure you are using a compatible shell (Bash).
###
Required Commands:
```
top ##For CPU and process information.
free ##For memory usage.
df ##For disk usage.
ss ##For network statistics.
grep, awk, curl, systemctl ##For various checks and parsing.
mail (for sending emails) ##Install with sudo apt-get install mailutils on Debian-based systems or sudo yum install mailx on Red Hat-based systems.
```
## Installation

1. Download the Script:
Save the script as automation.sh.

## 2. Make the Script Executable:

```
chmod +x /path/to/automation.sh
```

## 3. Setup Cron Job (for automated execution):

```
crontab -e
```
Add the following line to run the script daily at 2 AM and log the output:
```
0 2 * * * /path/to/automation.sh >> /path/to/log/automation.log 2>&1
```
## Usage
### Interactive Mode
Run the script in interactive mode to manually trigger checks or view specific metrics:
```
/path/to/automation.sh interactive
```

## Options:

1) CPU Usage
2) Memory Usage
3) Disk Usage
4) Network Statistics
5) Top Processes
6) Recent Log Entries
7) Health Checks
8) All
   
Example:
```
Select an option to view:
1) CPU Usage
2) Memory Usage
...
Enter your choice [1-8]: 2
Memory Usage: 45.2%
```

### Non-Interactive Mode
Run the script without arguments for automated execution (e.g., via cron):

```
/path/to/automation.sh
```

Output:

A detailed report is generated and saved in the specified log file.
Alerts are sent if thresholds are exceeded.

