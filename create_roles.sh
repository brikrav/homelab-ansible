#!/bin/bash

roles=(
  # "proxmox_vm_management"
  # "ubuntu_common"
  # "ubuntu_security"
  # "raspberry_pi_setup"
  # "file_server"
  # "backup"
  # "monitoring"
  "docker"
  # "kubernetes"
  # "network_management"
)

for role in "${roles[@]}"; do
  ansible-galaxy init "$role"
done
