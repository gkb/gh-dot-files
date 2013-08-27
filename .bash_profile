PROFILE=~/.profile
RCFILE=~/.bashrc
ALIASFILE=~/.bash_alias
TERMCAPFILE=~/.LESS_TERMCAP

if [[ -f "$PROFILE" ]]
then
        . "$PROFILE" # For the shell-independent but platform dependent paths
fi

if [[ -f "$TERMCAPFILE" ]]
then
        . "$TERMCAPFILE" # For a colorful less
fi

if [[ (-f "$RCFILE") && ("$-" == *i*) ]]
then
        . "$RCFILE" # For all other shell configuration in interactive shells
        if [[ (-f "$ALIASFILE") ]]
        then
                . "$ALIASFILE" # For aliases
        fi
fi
