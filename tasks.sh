#!/bin/bash

# ===============================================================
# System Information Script
# ===============================================================

OUTPUT="system_info.txt"

# Header Section
echo "##################################################" > "$OUTPUT"
echo "#####        SYSTEM INFORMATION REPORT       #####" >> "$OUTPUT"
echo "##################################################" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "Gathering system information..."

# Hostname
echo "Hostname:" >> "$OUTPUT"
hostname >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Operating System
echo "Operating System:" >> "$OUTPUT"
grep "^PRETTY_NAME" /etc/os-release | cut -d= -f2 | tr -d '"' >> "$OUTPUT"
echo "" >> "$OUTPUT"

# System Uptime
echo "System Uptime:" >> "$OUTPUT"
uptime -p >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Linux Kernel Version
echo "Linux Kernel Version:" >> "$OUTPUT"
uname -r >> "$OUTPUT"
echo "" >> "$OUTPUT"

# CPU Information
echo "CPU Information:" >> "$OUTPUT"
lscpu | grep -E "CPU\(s\)|On-line CPU\(s\) list|Model name|Socket\(s\)|NUMA node0 CPU\(s\)" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Memory Information
echo "Memory Information:" >> "$OUTPUT"
free -h >> "$OUTPUT"
echo "" >> "$OUTPUT"

# IP and Network Interface Information
echo "Network Information:" >> "$OUTPUT"
ip -brief address show >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Filesystem Utilization
echo "Filesystem Utilization:" >> "$OUTPUT"
df -hT >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Last 5 System Log Errors
echo "Last 5 error log entries:" >> "$OUTPUT"
grep -i "error" /var/log/syslog | tail -5 >> "$OUTPUT" 2>/dev/null
echo "" >> "$OUTPUT"

# Generate Report Timestamp
echo "Report Information:" >> "$OUTPUT"
echo "Generated on: $(date)" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "System Information has been saved to $OUTPUT"
