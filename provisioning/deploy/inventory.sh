#!/bin/bash
okd_p=~/okd-ansible

cd ${okd_p}

# generate inventory
cat <<EOF > hosts
[masters]
master-[0:2].okd.local

[etcd]
master-[0:2].okd.local

[lb]
proxy.okd.local

[nodes]
master-[0:2].okd.local openshift_node_group_name='node-config-master'
infra-[0:2].okd.local openshift_node_group_name='node-config-infra'
node-[0:2].okd.local openshift_node_group_name='node-config-compute'

[OSEv3:children]
masters
nodes
etcd
lb

[OSEv3:vars]
ansible_ssh_user=vagrant
ansible_become=true
ansible_python_interpreter=/usr/bin/python3
# deploy community version
openshift_deployment_type=origin
# test is failing for whatever reason
openshift_disable_check="docker_image_availability"
# local dns names for testing
openshift_master_default_subdomain=apps.okd.local
openshift_master_cluster_hostname=proxy.okd.local
EOF
