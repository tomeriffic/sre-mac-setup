#!/bin/zsh

EXIT_CODE=0

while read -r line; do
    if [[ $line != "#"* && $line != "" ]]; then
        if [[ $line == "--cask"* ]]; then
            brew install --cask "${line/--cask /}"
        else
            brew install "${line}"
        fi

        if [[ $? -ne 0 ]]; then
            echo "Error installing ${line}"
            EXIT_CODE=1
        fi
    fi
done < sre-tools.txt

exit $EXIT_CODE

