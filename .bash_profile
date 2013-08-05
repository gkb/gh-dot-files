PATH=$PATH:/usr/local/mysql/bin:~/scripts:/opt/local/libexec/gnubin:/opt/local/libexec/perl5.12:/usr/texbin
export PATH

# set the default editor
export EDITOR=/usr/bin/vim

case $- in
*i*)    # interactive shell
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
	export PS1;;
*)
	;;
esac

# Useful aliases
alias ls='ls $LS_OPTIONS -hF'
alias ll='ls $LS_OPTIONS -lhF'
alias l='ls $LS_OPTIONS -lAhF'
alias cd..="cd .."
alias c="clear"
alias e="exit"
alias ssh="ssh -X"
alias ..="cd .."
# More inspired by
# http://www.thegeekstuff.com/2008/10/6-awesome-linux-cd-command-hacks-productivity-tip3-for-geeks/
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

# Making info vi-like
alias info='info --vi-keys'

# Automatically correct misspelled directory names
shopt -s cdspell

# Enable extended shell globbing
shopt -s extglob

# Add /usr/local/sbin to PATH to stop homebrew from complaining each time
export PATH=$PATH:/usr/local/sbin

# MacPorts Installer addition on 2012-09-27_at_01:40:19: adding an appropriate PATH variable for use with MacPorts.
export PATH=$PATH:/opt/local/bin:/opt/local/sbin
# Finished adapting your PATH environment variable for use with MacPorts.

# Need my installs in /usr/local/bin to take precedence over ones in /usr/bin
# But first remove it from its current position in PATH
PATH=${PATH/\/usr\/local\/bin:/}
export PATH=/usr/local/bin:$PATH

# Set up Python nicely
export PYTHONSTARTUP='/Users/gajubhat/.python/startup.py'
# Include cython in the search path
export PYTHONPATH=$PYTHONPATH:/Users/gajubhat/Source_Code/cython/
export PATH=$PATH:/Users/gajubhat/Source_Code/cython/bin

# Including libraries for java
export CLASSPATH=$CLASSPATH:~/Source_Code/Java_Lib/algs4.jar:~/Source_Code/Java_Lib/stdlib.jar:.
# Setting JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home)
# Including Apache Ant & Apache Maven in the PATH variable
export PATH=$PATH:/usr/local/apache-ant:/usr/local/maven:$(/usr/libexec/java_home)

# Temporary hack for getting classpath to work with the code in Thinking in java
export CLASSPATH=$CLASSPATH:/usr/local/lib/jar/:~/Documents/Work/Code_Pen/java/Thinking_in_Java/TIJ4-code/

# Set architecture flags correctly to avoid headaches
export ARCHFLAGS="-arch x86_64"

# Set a global history file for R
export R_HISTFILE=~/.Rhistory

# Provide for easier combination of mkdir and cd
# See
# http://www.thegeekstuff.com/2008/10/6-awesome-linux-cd-command-hacks-productivity-tip3-for-geeks/
# for inspiration
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Get iPython and other programs to work
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/Current/bin
