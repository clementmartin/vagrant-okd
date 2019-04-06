#!/bin/bash
yum -y install epel-release
yum -y install git ansible

git clone https://github.com/openshift/openshift-ansible /tmp/okd-ansible

cat <<EOF > /tmp/inventory
# Create an OSEv3 group that contains the master, nodes, etcd, and lb groups.
# The lb group lets Ansible configure HAProxy as the load balancing solution.
# Comment lb out if your load balancer is pre-configured.
[OSEv3:children]
masters
nodes
etcd

# Set variables common for all OSEv3 hosts
[OSEv3:vars]
ansible_ssh_user=vagrant
ansible_become=true
openshift_deployment_type=origin

# uncomment the following to enable htpasswd authentication; defaults to AllowAllPasswordIdentityProvider
#openshift_master_identity_providers=[{'name': 'htpasswd_auth', 'login': 'true', 'challenge': 'true', 'kind': 'HTPasswdPasswordIdentityProvider'}]

# host group for masters
[masters]
master.okd.one

# host group for etcd
[etcd]
master.okd.one

# Specify load balancer host
#[lb]
#lb.example.com

# host group for nodes, includes region info
[nodes]
master.example.com openshift_node_group_name='node-config-master'
node-0.example.com openshift_node_group_name='node-config-compute'
node-1.example.com openshift_node_group_name='node-config-compute'
infra-0.example.com openshift_node_group_name='node-config-infra'
infra-1.example.com openshift_node_group_name='node-config-infra'
EOF