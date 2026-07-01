#!/bin/bash
set -euo pipefail

exec > >(tee /var/log/user-data.log | logger -t user-data -s 2>/dev/console) 2>&1

echo "Starting EC2 bootstrap"

EFS_DNS="${EFS_DNS}"
EFS_MOUNT_POINT="${EFS_MOUNT_POINT}"

dnf update -y

dnf install -y \
  amazon-efs-utils \
  nfs-utils \
  wget \
  unzip \
  tar \
  jq

systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent

mkdir -p "${EFS_MOUNT_POINT}"

if ! grep -q "${EFS_MOUNT_POINT}" /etc/fstab; then
  echo "${EFS_DNS}:/ ${EFS_MOUNT_POINT} efs _netdev,tls 0 0" >> /etc/fstab
fi

mount -a

echo "EFS mounted successfully at ${EFS_MOUNT_POINT}"

echo "EC2 bootstrap completed"