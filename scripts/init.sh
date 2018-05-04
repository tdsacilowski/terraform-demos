#!/usr/bin/env bash
set -x
exec > >(tee /var/log/tf-user-data.log|logger -t user-data ) 2>&1

logger() {
  DT=$(date '+%Y/%m/%d %H:%M:%S')
  echo "$DT $0: $1"
}

logger "Running"

##--------------------------------------------------------------------
## Install Ansible

sudo apt-get -qq -y update
sudo apt-get -qq -y install software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get -qq -y update
sudo apt-get -qq -y install ansible

cd /home/ubuntu/ansible
ansible-playbook -i "localhost," -c local nginx.yml

echo "finished"
