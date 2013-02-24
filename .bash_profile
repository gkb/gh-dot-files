PATH=$PATH:/usr/local/mysql/bin:~/scripts:/opt/local/libexec/gnubin/:/opt/local/libexec/perl5.12/:/usr/texbin
export PATH

# set the default editor
export EDITOR=/usr/bin/vim

PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 30 ]; then CurDir=${DIR:0:12}...${DIR:${#DIR}-15}; else CurDir=$DIR; fi'

# make bash autocomplete with up arrow
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# make tab cycle through commands instead of listing
bind '"\t":menu-complete'
bind "set completion-ignore-case on"

# show current directory on the bash prompt
PS1='\[\e[1;32m\]\u@\H:\[\e[m\e[1;35m\]\w\[\e[m\]$'
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${USER}@${HOSTNAME}: ${PWD}\007\]$PS1"
    ;;
*)
    ;;
esac
export PS1

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    #eval "`dircolors ~/.dir_colors`"
    alias ll='ls --format=vertical --color=auto -lah'
    alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# Useful aliases
alias ls='ls $LS_OPTIONS -hF'
alias ll='ls $LS_OPTIONS -lhF'
alias l='ls $LS_OPTIONS -lAhF'
alias cd..="cd .."
alias c="clear"
alias e="exit"
alias ssh="ssh -X"
alias ..="cd .."

# Alias for wpshell
alias wpsh="/Users/gajubhat/Source_Code/wpcom/trunk/bin/wpshell/wpshell"

#creating alias for mysql
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

# For Cint
CINTSYSDIR=/Users/gajubhat/Source_Code/cint/bin
PATH=$PATH:$CINTSYSDIR
MANPATH=$MANPATH:$CINTSYSDIR/../doc
LD_LIBRARY_PATH=.:$CINTSYSDIR:$LD_LIBRARY_PATH
export PATH CINTSYSDIR MANPATH LD_LIBRARY_PATH

# Add /usr/local/sbin to PATH to stop homebrew from complaining each time
export PATH=$PATH:/usr/local/sbin

# MacPorts Installer addition on 2012-09-27_at_01:40:19: adding an appropriate PATH variable for use with MacPorts.
export PATH=$PATH:/opt/local/bin:/opt/local/sbin
# Finished adapting your PATH environment variable for use with MacPorts.

# Set up Python nicely
export PYTHONSTARTUP='/Users/gajubhat/.python/startup.py'
# Include cython in the search path
export PYTHONPATH=$PYTHONPATH:/Users/gajubhat/Source_Code/cython/
export PATH=$PATH:/Users/gajubhat/Source_Code/cython/bin

# Including libraries for java
export CLASSPATH=$CLASSPATH:~/Source_Code/Java_Lib/algs4.jar:~/Source_Code/Java_Lib/stdlib.jar

# Set architecture flags correctly to avoid headaches
export ARCHFLAGS="-arch x86_64"

# Set a global history file for R
export R_HISTFILE=~/.Rhistory
