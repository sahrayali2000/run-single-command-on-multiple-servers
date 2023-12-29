#!/bin/bash

# Set the configuration file path
config_file="/etc/ssh/ssh_config"

# Define the new values
new_values="#   StrictHostKeyChecking ask"
replacement_values="StrictHostKeyChecking no"
sed -i "s|$new_values|$replacement_values|" "$config_file"

new_values="#   UserKnownHostsFile ~/.ssh/known_hosts.d/%k"
replacement_values="UserKnownHostsFile /dev/null"
sed -i "s|$new_values|$replacement_values|" "$config_file"


# Set variables from command line arguments
host="$1"
username="$2"
password="$3"
command_to_run="${@:4}"

# Check if all required arguments are provided
if [ $# -lt 4 ]; then
    echo "Usage: $0 <host> <username> <password> <command>"
    exit 1
fi

# Install sshpass if not already installed
apt-get update
apt install -y sshpass

# SSH connection and command execution

sshpass -p "$password" ssh "$username@$host" "$command_to_run"
