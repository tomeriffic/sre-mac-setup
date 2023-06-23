#!/bin/zsh

EXIT_CODE=0

while read -r line; do
    if [[ $line != "#"* && $line != "" ]]; then
        if [[ $line == "--cask"* ]]; then
            command="brew install --cask ${line/--cask /}"
        else
            command="brew install ${line}"
        fi

        eval $command
        exit_status=$?
        if [[ $exit_status -ne 0 ]]; then
            echo "Error installing ${line}"
            EXIT_CODE=1
        fi
    fi
done < sre-tools.txt

exit $EXIT_CODE

if [[ $EXIT_CODE -ne 0 ]]; then
    echo "Script failed with an error"
fi


