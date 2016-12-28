# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# ls aliases
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -A'
alias l="ls -la"
#alias l='ls -CF'

# common folders
alias cdo='cd ~/Downloads'
alias cde='cd ~/Desktop'
alias cw='cd ~/web' # I symlink Apache's web/documents folder to here

# Personal repo aliases
alias cre='cd $PERSONAL_REPO_PATH/'
alias cst='cd $PERSONAL_REPO_PATH/streamagatchi'
alias ctr='cd $PERSONAL_REPO_PATH/truckrush'
alias coff='cd $PERSONAL_REPO_PATH/office-mapper'

# git shortcuts
alias gp='git pull'
alias gs='git status'

# Open the browser for github urls.
# This one works for git.corp.ooyala.com, and github.com
ghe() {
  originUrl=`git config --get remote.origin.url`
  echo $originUrl
  if [[ $originUrl == *"git.corp"* ]]
  then
    open $(git config --get remote.origin.url | sed "s#.*/\(.*\)/\(.*\)\.git#https://git.corp.ooyala.com/projects/\1/repos/\2"#)
  else
    open http://$(git config --get remote.origin.url | tr : /)    
  fi
}

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# decrypt b64 strings, for example URLS passed to html5
# usage: b64 aHR0cDovL3BsYXllci5vb3lhbGEuY29tL3BsYXllci9pcGhvbmUvSnBOekJ6TnpyNGNIY0pCWUZKSHY3RGVIQ25xRDdEY0gubTN1OA==
b64() {
  echo $1 | base64 -D
  echo ""
}

# simple file finder
# usage: `f *nuplayer*`
alias f='find . -name'
