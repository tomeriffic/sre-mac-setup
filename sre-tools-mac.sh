input_file="sre-tools.txt"

# Install tools and continue on errors
cat "$input_file" | xargs -I {} zsh -c 'brew install {} || true'
