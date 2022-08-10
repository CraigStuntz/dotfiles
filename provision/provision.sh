#! /bin/bash
set -euo pipefail

if ! command -v brew &> /dev/null
then
    echo "[provision.sh] Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

if ! command -v ansible &> /dev/null
then
    echo "[provision.sh] Installing ansible..."
    brew install ansible
fi

echo "[provision.sh] Executing Ansible playbook..."
ansible-playbook playbook.yaml -i inventory.yaml