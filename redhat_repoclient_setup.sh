#!/bin/bash
# Author                 : Christo Deale
# Date	                 : 2024-04-24
# redhat_repoclient_setup: Utility to setup repo conf on clientside

# Prompt for input
read -p "Enter the IP address of the repository server: " REPO_SERVER_IP

# Create repository configuration file
echo "[redhat_repo]" | sudo tee /etc/yum.repos.d/redhat_repo.repo > /dev/null
echo "name=My Custom Repository" | sudo tee -a /etc/yum.repos.d/redhat_repo.repo > /dev/null
echo "baseurl=http://$REPO_SERVER_IP/redhat_repo" | sudo tee -a /etc/yum.repos.d/redhat_repo.repo > /dev/null
echo "enabled=1" | sudo tee -a /etc/yum.repos.d/redhat_repo.repo > /dev/null
echo "gpgcheck=0" | sudo tee -a /etc/yum.repos.d/redhat_repo.repo > /dev/null

# Refresh repository cache
sudo dnf makecache

echo "Repository configuration completed successfully."
