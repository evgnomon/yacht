#!/bin/sh

export ANSIBLE_STDOUT_CALLBACK=yaml
ansible-playbook -i "${INPUT_INVENTORY}" "${INPUT_PLAYBOOK}" -v -e 'ansible_python_interpreter=/opt/python/bin/python3' ${INPUT_ARGS}
