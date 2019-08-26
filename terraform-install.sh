#!/bin/bash

yum update -y
wget https://releases.hashicorp.com/terraform/0.12.7/terraform_0.12.7_linux_amd64.zip
unzip terraform_0.12.7_linux_amd64.zip
rm -rf terraform_0.12.7_linux_amd64.zip
mv terraform /usr/local/bin
cat >> ~/.bash_profile << EOF

export PATH=$PATH:/usr/local/bin/terraform

EOF
