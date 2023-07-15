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

# install kyverno cli
CLI_VERSION=v1.10.1
curl -LO https://github.com/kyverno/kyverno/releases/download/${CLI_VERSION}/kyverno-cli_${CLI_VERSION}_linux_x86_64.tar.gz
tar -xvf kyverno-cli_${CLI_VERSION}_linux_x86_64.tar.gz
cp kyverno /usr/local/bin/

# mark init finished
touch /ks/.initfinished
