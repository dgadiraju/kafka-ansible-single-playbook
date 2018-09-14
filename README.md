# kafka-ansible-single-playbook

This is primarily to setup Kafka environment using single ansible playbook to setup required softwares and then configure and start services manually.

# Instructions

* Make sure you environment categorized into multiple groups
* Clone this repository
* Update hosts files with appropriate DNS aliases or ip addresses
* Update paths in the playbook before you apply as per your path
* Apply playbook
* Run commands in configure.sh for post installation steps
* Run commands in validate.sh to make sure our cluster is set up properly
