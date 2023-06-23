#!/bin/zsh

TOOLS_INSTALLED=0
TOTAL_TOOLS=$(grep -c -v "#" sre-tools.txt)

while read -r line; do
    if [[ $line != "#"* && $line != "" ]]; then
        if [[ $line == "--cask"* ]]; then
            command="brew install --cask ${line/--cask /}"
        else
            command="brew install ${line}"
        fi

        eval $command
        exit_status=$?
        if [[ $exit_status -eq 0 ]]; then
            ((TOOLS_INSTALLED++))
        else
            echo "Error installing ${line}"
        fi
    fi
done < sre-tools.txt

echo "Total tools: $TOTAL_TOOLS"
echo "Tools installed: $TOOLS_INSTALLED"

if [[ $TOOLS_INSTALLED -eq $TOTAL_TOOLS ]]; then
    brew cleanup
fi