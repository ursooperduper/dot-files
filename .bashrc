#!/bin/bash
# sooperduper <http://github.com/sooperduper/dotfiles>

################################################################################
# References                                                                   #
################################################################################
# seaofclouds <http://github.com/seaofclouds/dotfiles>
# zacwill <http://github.com/zachwill/dotfiles>
# ryanb <http://github.com/ryanb/dotfiles>
# mathiasbynens <http://github.com/mathiasbynens>
# justinlilly <http://github.com/justinlilly/jlilly-bashy-dotfiles>


################################################################################
# Basics                                                                       #
################################################################################
: ${HOME=~}
: ${LOGNAME=$(id -un)}
: ${UNAME=$(uname)}

# Vi editing mode for bash.
set -o vi

# Path
#export PATH=/Users/sarah/.rvm/gems/ruby-2.1.2/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/bin/env:/opt/local/bin:/Users/sarah/code/jira/"$(brew --prefix)"/gems/gli-1.6.0/bin:/usr/local/Cellar/qt/4.8.2/bin:/Applications/mongodb-osx-x86_64-2.6.6/bin:$PATH

export PATH=/usr/local/bin:/usr/local/heroku/bin:/usr/bin/env:/opt/local/bin:$HOME/.rvm/bin:$PATH

export EDITOR='atom'
export GEM_HOME="$(brew --prefix)"
#export JAVA_HOME=$(/usr/libexec/java_home)

if [ -f ~/.bash_bindings ]; then
  source ~/.bash_bindings
fi

# if [ -f $(brew --prefix)/etc/bash_completion ]; then
#   . $(brew --prefix)/etc/bash_completion
# fi

source "$(brew --prefix)/etc/bash_completion"

# rvm config
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
if [[ -s $HOME/.rvm/scripts/completion ]] ; then source $HOME/.rvm/scripts/completion ; fi


################################################################################
# General UX/UI                                                                #
################################################################################

# Set color options
export TERM=xterm-color
export GREP_OPTIONS='--color=auto'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Useful color vars
export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'

# for my Jira script -- this will allow autocompletion
#function get_jira_commands()
# {
#  if [ -z $2 ] ; then
#    COMPREPLY=('jira help -c')
#  else
#    COMPREPLY=('jira help -c $2')
#  fi
#}

#complete -F get_jira_commands find


################################################################################
# Aliases / Functions                                                          #
################################################################################
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'
# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"
# Quick access to my blog project
alias blog='cd /Users/sarah/code/ursooperduper.github.io && \. tmux-ursoop-sess'
# Get just the homebrew updates
alias brewup='brew update; brew upgrade -all'
alias cheat='cd /Users/sarah/code/cheatsheets && \. tmux-cheat-sess'
# Where most of my code lives
alias code='cd ~/code'
alias cl='clear'
# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias db='cd ~/Dropbox'
# Disk free, in gigabytes, not bytes
alias df='df -h'
alias doc='cd ~/Documents'
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias d='cd ~/Dropbox'
# Calculate total disk usage for a folder
alias du='du -h -c'
# Disk usage with human sizes and minimal depth
alias du1='du -h --max-depth=1'
# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"
# Find
alias fn='find . -name'
alias g='git'
alias h='history'
# Go home
alias home='cd ~'
# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
# Show me good stuff in a directory listing
alias ls='ls -laG'
alias mu='cd ~/Music'
alias o='open'
alias oo='open .'
# Good manners
alias please=sudo
alias py='python'
# Reload this file
alias reload='. ~/.bashrc'
# Run the findjiras script
alias rj='ruby ~/code/ruby-findjiras/findjiras.rb'
# Totally remove it
alias rm!='rm -rf'
alias serve='python -m SimpleHTTPServer 8000'
# Get OS X Software Updates, update Homebrew itself, and upgrade installed Homebrew packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade -all; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'
alias vi='vim' # Use vimmmmmmm
# Get week number
alias week='date +%V'
# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"
alias x='exit' # Close window

# Show/hide hidden files in Finder
alias show='defaults write com.apple.Finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hide='defaults write com.apple.Finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# https://github.com/nvbn/thefuck
eval "$(thefuck --alias)"
# You can use whatever you want as an alias, like for Mondays:
eval "$(thefuck --alias FUCK)"

# Create a directory and cd into it
function mkcd () {
  mkdir -p "$@" && eval cd "\"\$$#\"";
}

# Changing directory to code project
function c { cd ~/code/$1; }

# Extract any file type
function extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)        tar xjf $1        ;;
      *.tar.gz)         tar xzf $1        ;;
      *.bz2)            bunzip2 $1        ;;
      *.rar)            unrar x $1        ;;
      *.gz)             gunzip $1         ;;
      *.tar)            tar xf $1         ;;
      *.tbz2)           tar xjf $1        ;;
      *.tgz)            tar xzf $1        ;;
      *.zip)            unzip $1          ;;
      *.Z)              uncompress $1     ;;
      *.jar)	          unzip $1   	;;
      *)                echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# cd up n directories
function up() { [ $(( $1 + 0 )) -gt 0 ] && cd $(eval "printf '../'%.0s {1..$1}"); }

################################################################################
# Git                                                                          #
################################################################################
alias rv='git rev-list'
alias gpl='git pull'
alias gpu='git push'
alias ga="git add ."
alias gl='git log'
alias gb='git branch'
alias gbr='git branch -r' #list of remote-tracking branches
alias gba='git branch -a' # list of all branches (local and remote)
alias gd='git diff | subl'
alias gst='git status'
alias gco='git checkout'
alias gc='git commit -am'
alias gu='git up'
alias gs='git status'
alias gf='git fetch'
alias gr='git remote -v'

alias gpg="git push github master"
alias gpo="git push origin master"
alias gplg="git up github master"
alias gplo="git up origin master"

source ~/.git_completion.sh

#function parse_git_dirty {
#  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
#}

#function parse_git_branch {
#  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
#}

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true


# ##############################################################################
# Prompt                                                                      ##
# ##############################################################################

# path prompt
rvm_path() {
  local prompt=$(~/.rvm/bin/rvm-prompt)
  if [[ $prompt != "" ]]; then
    printf "[$prompt] "
  fi
}

#PS1='$(rvm_path)\h:\w$(__git_ps1 " [%s]")\$ '
#PS1='\u:\W : '
#PS1='\W$(__git_ps1 " [%s]") $ '
PS1='\[\e[00;36m\]\W\[\e[0m\]$(__git_ps1 " [%s]") $ '

#export PS1='\u:\W : '
#export PS1='\h:\W$(__git_ps1 "[\[\e[0;32m\]%s\[\e[0m\]\[\e[0;33m\]$(parse_git_dirty)\[\e[0m\]]")$ '

# Cool characters: ✩ ✪ ⚡
#export PS1='\u:\W $(__git_ps1 "(\[\e[0;32m\]%s\[\e[0m\]\[\e[0;33m\]$(parse_git_dirty)\[\e[0m\]) ")⚡  ' # shows git branch checked out
#export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
#export PS1='\u:\W ⚡ '

################################################################################
# Fun stuff                                                                    #
################################################################################
# Because I sometimes forget I'm not in Vim
alias :q='echo LOLVIM'
alias :w='echo LOLVIM'
alias :wq='echo LOLVIM'

# Because http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"

################################################################################
# Command History                                                              #
################################################################################
# big history
export HISTSIZE=1000
# format history with timestamp
# 319  | 2010-06-02 09:02PM | reload
export HISTTIMEFORMAT="| %F %I:%M%p | "
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -r; $PROMPT_COMMAND"
# ignore repeat commands
export HISTCONTROL=erasedups
# ignore specific commands
export HISTIGNORE="&:cl:x"
# speedy history
# usage:  $ hi 4 ; will list last 4 commands
# or:     $ hi keyword ; will grep history for keyword
function hi(){
  if [[ $1 =~ ^[0-9]+$ ]]; then
    command history | tail -n "$1";
  elif [ "$1" != "" ]; then
    command history | grep "$1";
  else
    command history | tail -20;
  fi
}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
