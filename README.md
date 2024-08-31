# Introduction

Use Yacht to run Ansible jobs as is running locally also in Github Actions.

# Usage
Create a playbook in your Github repository, for example `main.yaml` in `playbooks` directory.
```yaml
---
- name: Main Playbook
  hosts: localhost
  gather_facts: false
  tasks:
    - debug:
        msg: "Hello from main.yaml"
  tags:
    - always
```

And Use yacht to run the playbook in Github Actions:
```yaml
name: Main

on:
  push:

jobs:
  main:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - name: Run Playbook
      uses: evgnomon/yacht@main
      with:
        playbook: 'playbooks/main.yaml'
```
