#!/bin/bash

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
# Add required dependencies for the jenkins package
sudo yum install fontconfig java-17-openjdk -y
sudo yum install jenkins -y
sudo systemctl daemon-reload
# Start Services
sudo systemctl enable jenkins
sudo systemctl start jenkins
# Firewall config
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload
