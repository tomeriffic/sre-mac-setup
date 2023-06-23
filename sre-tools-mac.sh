#!/bin/zsh

tool_list_file="sre-tools.txt"
failed_tools=""

while IFS= read -r tool; do
  if ! brew install "$tool"; then
    failed_tools+="\n- $tool"
  fi
done < "$tool_list_file"

echo -e "Failed to install the following tools:$failed_tools"

brew cleanup || true
