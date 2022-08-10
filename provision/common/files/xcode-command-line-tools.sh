#!/bin/bash
# Thank you, "BaseZen" https://apple.stackexchange.com/a/325089/159747
# Requires root
os=$(sw_vers -productVersion | awk -F. '{print $1 "." $2}')
if softwareupdate --history | grep --silent "Command Line Tools.*${os}"; then
    echo 'Command-line tools already installed.' 
else
    echo 'Installing Command-line tools...'
    xcode-select --install
    echo 'Installation succeeded.'
fi