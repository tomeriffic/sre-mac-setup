#!/bin/zsh

TOOLS_INSTALLED=0
TOOLS_SKIPPED=0
SKIPPED_TOOLS=""

input_file="sre-tools.txt"

while IFS= read -r line; do
    if [[ $line == "--cask"* ]]; then
        command="brew install --cask ${line/--cask /}"
    else
        command="brew install ${line}"
    fi

    eval $command && ((TOOLS_INSTALLED++)) || { ((TOOLS_SKIPPED++)); SKIPPED_TOOLS+="$line\n"; }
done < "$input_file"

echo "Total tools: $((TOOLS_INSTALLED + TOOLS_SKIPPED))"
echo "Tools installed: $TOOLS_INSTALLED"
echo -e "Tools skipped: $TOOLS_SKIPPED\n$SKIPPED_TOOLS"
