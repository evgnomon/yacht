#!/bin/bash

export ANSIBLE_STDOUT_CALLBACK=yaml

if [ -z "$INPUT_VAULT_PASS" ]; then
  ansible-playbook -v \
    -e 'ansible_python_interpreter=/opt/python/bin/python3'\
    -i "$INPUT_INVENTORY" \
    "$INPUT_PLAYBOOK" \
    $INPUT_ARGS
  exit $?
fi

ANSIBLE_VAULT_PASSWORD_FILE=<(echo "$INPUT_VAULT_PASS") INPUT_VAULT_FILE=<(echo "$INPUT_VAULT")\
  ansible-playbook -v \
  -e 'ansible_python_interpreter=/opt/python/bin/python3'\
  -i "$INPUT_INVENTORY" \
  "$INPUT_PLAYBOOK" \
  $INPUT_ARGS
