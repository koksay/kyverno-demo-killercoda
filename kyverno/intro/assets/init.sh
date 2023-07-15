#!/bin/bash

# init scenario
rm $0
bash /ks/k8s.sh
mkdir -p /opt/ks
cat <<EOT > /root/.vimrc
set expandtab
set tabstop=2
set shiftwidth=2
EOT

# scenario specific
apt-get update
apt-get install -y bat
kubectl taint node controlplane node-role.kubernetes.io/control-plane:NoSchedule-

# mark init finished
touch /ks/.initfinished
