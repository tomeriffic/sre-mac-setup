#!/bin/zsh

TOOLS_INSTALLED=0
TOOLS_SKIPPED=0
SKIPPED_TOOLS=""

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
            SKIPPED_TOOLS+="- ${line}\n"
        fi
    fi
done < sre-tools.txt

echo "Total tools: $((TOOLS_INSTALLED + TOOLS_SKIPPED))"
echo "Tools installed: $TOOLS_INSTALLED"
echo -e "Tools skipped: $TOOLS_SKIPPED\n$SKIPPED_TOOLS"

if [[ $TOOLS_INSTALLED -gt 0 ]]; then
    brew cleanup
fi