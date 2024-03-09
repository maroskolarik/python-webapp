#!/bin/bash
echo "ubuntu:kontrolS4" | chpasswd
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
service systemctl restart ssh