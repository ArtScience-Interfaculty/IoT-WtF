# Bash functions and aliases

# run (from within the `bash' folder)
source ./bash_aliases

# or put it in your ~/.bashrc file, so they're automatically loaded when opening a terminal
echo "source `pwd`/bash_aliases" >> ~/.bash_profile && cat ~/.bash_profile

source ~/.bash_profile

