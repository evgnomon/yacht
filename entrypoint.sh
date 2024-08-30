#!/bin/sh

ansible-playbook -i "${INPUT_INVENTORY}" "${INPUT_PLAYBOOK}" -e 'ansible_python_interpreter=/opt/python/bin/python3'
