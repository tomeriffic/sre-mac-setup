#!/bin/zsh

while read -r line; do
    if [[ $line != "#"* && $line != "" ]]; then
        if [[ $line == "--cask"* ]]; then
            brew install --cask "${line/--cask /}" || true
        else
            brew install "${line}" || true
        fi
    fi
done < file.txt

code --install-extension hashicorp.terraform hashicorp.hcl github.vscode-github-actions github.vscode-pull-request-github
