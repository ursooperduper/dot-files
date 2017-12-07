if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/sarah/.gvm/bin/gvm-init.sh" ]] && source "/Users/sarah/.gvm/bin/gvm-init.sh"
# export JAVA_HOME=$(/usr/libexec/java_home)

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
