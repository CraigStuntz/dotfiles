#! /bin/bash
set -euo pipefail

if ! command -v brew &> /dev/null
then
    echo "[provision.sh] Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if ! command -v ansible &> /dev/null
then
    echo "[provision.sh] Installing ansible..."
    brew install ansible
fi

echo "[provision.sh] Executing Ansible playbook..."
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo $SCRIPT_DIR
ansible-playbook "$@" $SCRIPT_DIR/playbook.yaml -i $SCRIPT_DIR/inventory.yaml 