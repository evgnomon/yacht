#!/bin/bash

export ANSIBLE_STDOUT_CALLBACK=yaml

if [ -z "$INPUT_VAULT_PASS" ]; then
    ansible-playbook -i "${INPUT_INVENTORY}"\
    "${INPUT_PLAYBOOK}" -v \
    -e 'ansible_python_interpreter=/opt/python/bin/python3'\
    ${INPUT_ARGS}
  exit $?
fi

ANSIBLE_VAULT_PASSWORD_FILE=<(echo "$INPUT_VAULT_PASS")\
  ansible-playbook -i "${INPUT_INVENTORY}"\
  --vault-password-file <(echo "$INPUT_VAULT") \
  "${INPUT_PLAYBOOK}" -v \
  -e 'ansible_python_interpreter=/opt/python/bin/python3'\
  ${INPUT_ARGS}
