#!/bin/zsh

tool_list_file="sre-tools.txt"

failed_tools=""

while IFS= read -r tool; do
  command="brew install $tool"

  if ! eval $command; then
    failed_tools+="- $tool\n"
  fi
done < "$tool_list_file"

echo -e "Failed tools:\n$failed_tools"