input_file="sre-tools.txt"
output_file="failed-tools.txt"

# Install tools and continue on errors
cat "$input_file" | xargs -I {} zsh -c 'brew install {} || true'

# Display failed tools
grep -vxFf <(brew list 2>/dev/null) "$input_file" > "$output_file"
