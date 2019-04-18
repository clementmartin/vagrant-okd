#!/bin/bash

# openshift-ansible clone path
okd_p=~/okd-ansible
# openshift release
rel='3.11'

# clone playbooks and roles
git clone https://github.com/openshift/openshift-ansible ${okd_p}
cd ${okd_p}
git checkout release-${rel}
