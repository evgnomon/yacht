#!/bin/bash

eval $(ssh-agent)

export ANSIBLE_STDOUT_CALLBACK=yaml
export ANSIBLE_CONFIG=/opt/yacht/ansible.cfg

[ -z "$INPUT_PLAYBOOK" ] && INPUT_PLAYBOOK=playbooks/main.yaml
[ -z "$INPUT_INVENTORY" ] && INPUT_INVENTORY=playbooks/inventory.yaml

if [ -z "$INPUT_VAULT_PASS" ]; then
  ansible-playbook -v \
    -i "$INPUT_INVENTORY" \
    "$INPUT_PLAYBOOK" \
    $INPUT_ARGS
  exit $?
fi

ANSIBLE_VAULT_PASSWORD_FILE=<(echo "$INPUT_VAULT_PASS") INPUT_VAULT_FILE=<(echo "$INPUT_VAULT")\
  ansible-playbook \
  -i "$INPUT_INVENTORY" \
  "$INPUT_PLAYBOOK" \
  $INPUT_ARGS
