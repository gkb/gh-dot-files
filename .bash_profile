PROFILE=~/.profile
RCFILE=~/.bashrc

if [ -f "$PROFILE" ]
then
        . "$PROFILE" # For the shell-independent paths
fi
if [ -f "$RCFILE" ]
then
        . "$RCFILE" # For all other shell configuration
fi
