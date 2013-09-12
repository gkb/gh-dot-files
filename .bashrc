# Automatically correct misspelled directory names
shopt -s cdspell

# Enable extended shell globbing
shopt -s extglob

######
# History Management
######

# Don't export history variables because the exec commands don't need them
HISTIGNORE="pwd:history"
HISTCONTROL=ignoreboth:erasedups
HISTTIMEFORMAT="%F %T "

# Append the current command to the history file as soon as we're done
shopt -s histappend

# Failed history expansions should be loaded into the readline buffer
shopt -s histreedit

# Load history expansion in the readline buffer before sending it to the shell
# parser
shopt -s histverify

# Save each line of a multi-line bash command to history
shopt -s cmdhist

######

# Get globbing to work recursively
shopt -s globstar

# Get piping commands to be more informative
set -o pipefail

if [[ "$-" == *i* ]]
then
	# make bash autocomplete with up arrow
	bind '"\e[A":history-search-backward'
	bind '"\e[B":history-search-forward'

	# make tab cycle through commands instead of listing
	bind '"\t":menu-complete'
	bind "set completion-ignore-case on"

        # Construct the primary prompt
        PS1=""
        # Show the user and host
	PS1="${PS1}\[\e[1;32m\]\u@\H:\[\e[m\]"
        # Show the number of currently running jobs
        PS1="${PS1}\[\e[1;30m\]Jobs-\j:\[\e[m\]"
        # Show the working directory truncated to a maximum of
        # two trailing directories
        PROMPT_DIRTRIM=2
        PS1="${PS1}\[\e[1;35m\]\w\[\e[m\]"
        # Add the $ symbol
        PS1="${PS1}$"

        if [[ "$TERM" =~ xterm*|rxvt* ]]
        then
	    PS1="\[\e]0;${USER}@${HOSTNAME}: ${PWD}\007\]$PS1"
        fi
	export PS1
fi

# Provide for easier combination of mkdir and cd
# See
# http://www.thegeekstuff.com/2008/10/6-awesome-linux-cd-command-hacks-productivity-tip3-for-geeks/
# for inspiration
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
