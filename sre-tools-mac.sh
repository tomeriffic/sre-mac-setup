#!/bin/zsh

tool_list_file="sre-tools.txt"

while IFS= read -r tool; do
  command="brew install $tool || true"

  eval $command
done < "$tool_list_file"
