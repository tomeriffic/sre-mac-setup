#!/bin/zsh

EXIT_CODE=0
PACKAGES_INSTALLED=0
TOTAL_PACKAGES=$(grep -c -v "#" sre-tools.txt)

while read -r line; do
    [[ $line == "#"* || $line == "" ]] && continue

    command="brew install ${line/#--cask /}"
    eval $command
    [[ $? -ne 0 ]] && { echo "Error installing ${line}"; EXIT_CODE=1; } || ((PACKAGES_INSTALLED++))
done < sre-tools.txt

[[ $PACKAGES_INSTALLED -eq $TOTAL_PACKAGES ]] && brew cleanup

exit $EXIT_CODE

[[ $EXIT_CODE -ne 0 ]] && echo "Script failed with an error"