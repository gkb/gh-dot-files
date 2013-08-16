PROFILE=~/.profile
SHENV=~/.sh_env
RCFILE=~/.bashrc
ALIASFILE=~/.bash_alias

if [[ -f "$PROFILE" ]]
then
        . "$PROFILE" # For the shell-independent but platform dependent paths
fi

if [[ -f "$SHENV" ]]
        . "$SHENV" # For the shell-independent but platform independent paths
fi

if [[ (-f "$RCFILE") && ("$-" == *i*) ]]
then
        . "$RCFILE" # For all other shell configuration in interactive shells
        . "$ALIASFILE" # For aliases
fi
