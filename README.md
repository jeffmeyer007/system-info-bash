# System Information Bash Script

This repository contains a Bash script that generates a full system information report for Linux systems.  
It was created as part of **CYBIT210 – Module 14 Skills Assessment 2**.

---

# Features

This script collects and outputs the following system information:

- Hostname  
- Operating system  
- System uptime  
- Linux kernel version  
- CPU information  
  - Total CPUs  
  - Model name  
  - Socket count  
  - NUMA node information  
- Memory usage (`free -h`)  
- Network interfaces (`ip -brief address show`)  
- Filesystem utilization (`df -hT`)  
- Last 5 system error log entries (`/var/log/syslog`)

All information is saved to: **`system_info.txt`**

---

# Usage

Run the script:

```bash
chmod +x tasks.sh
./tasks.sh









