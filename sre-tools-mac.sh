#!/bin/zsh

while read -r line; do
    if [[ $line != "#"* && $line != "" ]]; then
        if [[ $line == "--cask"* ]]; then
            brew install --cask "${line/--cask /}" || true
        else
            brew install "${line}" || true
        fi
    fi
done < sre-tools.txt

