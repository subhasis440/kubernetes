#!/bin/bash

# Enable ssh password authentication and ChallengeResponseAuthentication
echo "[TASK 1] Enable ssh password authentication and ChallengeResponseAuthentication"
sudo sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/^PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed -i 's/^ChallengeResponseAuthentication .*/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl reload sshd

# Set Root password
echo "[TASK 2] Set root password"
echo -e "kubeadmin\nkubeadmin" | sudo passwd root >/dev/null 2>&1
