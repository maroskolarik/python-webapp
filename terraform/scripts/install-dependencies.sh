#!/bin/bash
curl -fsSL https://get.docker.com | sh
groupadd docker
usermod -aG docker ubuntu
newgrp docker
apt update && apt install openjdk-17-jdk -y