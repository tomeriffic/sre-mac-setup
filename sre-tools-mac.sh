#!/bin/zsh

TOOLS_INSTALLED=0
TOOLS_SKIPPED=0
TOTAL_TOOLS=$(grep -c -v "#" sre-tools.txt)

while read -r line; do
    if [[ $line != "#"* && $line != "" ]]; then
        if [[ $line == "--cask"* ]]; then
            command="brew install --cask ${line/--cask /}"
        else
            command="brew install ${line}"
        fi

        eval $command
        if [[ $? -eq 0 ]]; then
            ((TOOLS_INSTALLED++))
        else
            echo "Error installing ${line}"
            ((TOOLS_SKIPPED++))
        fi
    fi
done < sre-tools.txt

echo "Total tools: $TOTAL_TOOLS"
echo "Tools installed: $TOOLS_INSTALLED"
echo "Tools skipped: $TOOLS_SKIPPED"

if [[ $TOOLS_INSTALLED -gt 0 ]]; then
    brew cleanup
fi