#!/bin/bash

echo "Setup hadoop user account..."

# Create hadoop user account
adduser --disabled-password --gecos "" hadoop
echo 'hadoop:hadoop' | chpasswd

# Setup password-less login
sudo -u hadoop ssh-keygen -t rsa -P '' -f /home/hadoop/.ssh/id_rsa
sudo -u hadoop /bin/bash -c 'cat /home/hadoop/.ssh/id_rsa.pub >> /home/hadoop/.ssh/authorized_keys'

# Scan ssh server public key
sudo -u hadoop /bin/bash -c 'ssh-keyscan -H -t ecdsa localhost > /home/hadoop/.ssh/known_hosts'
