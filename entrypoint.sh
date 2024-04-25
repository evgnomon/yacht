#!/bin/sh -l

# Run the Ansible playbook
ansible-playbook -i "${INPUT_INVENTORY}" "${INPUT_PLAYBOOK}"
