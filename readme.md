# My Ansible Playbooks

This is an Ansible project for managing various servers and virtual machines in my homelab.

## Requirements

- Ansible >= 2.9
- Python >= 3.6

## Setup

Template bri-secrets.yml

```yml
---
ansible_ssh_private_key_file: ~/my-key.pem
ansible_become: true
```

## Using SSH Agent with Ansible

If you are using a passphrase-protected private key for authentication with your Ansible hosts, it's recommended to use an SSH agent to cache the decrypted key. This will prevent Ansible from repeatedly asking for the passphrase during playbook execution.

Follow these steps to use an SSH agent with your private key:

1. Start the SSH agent:

```bash
eval "$(ssh-agent -s)"
```

This command starts the SSH agent and sets the required environment variables.

2. Add your private key to the SSH agent:

```bash
ssh-add ~/my-key.pem
```

Enter the passphrase for your private key when prompted. The SSH agent will now cache the decrypted key and provide it to Ansible when needed.


## Usage

To run the playbook, use the following command:

TODO add examples of all playbooks and roles

```bash
ansible-playbook playbooks/global/check-connection.yml
ansible-playbook playbooks/global/print-host-info.yml
ansible-playbook playbooks/global/run-container-agent.yml
```

```bash
ansible-playbook update-apt-ubuntu.yml
```

## MIT License

Copyright (c) 2023 brikrav

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
