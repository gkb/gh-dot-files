PATH=$PATH:/usr/local/mysql/bin:~/Scripts:/opt/local/libexec/gnubin:/opt/local/libexec/perl5.12:/usr/texbin

# Temporary fix for executables with user-level permission
PATH=$PATH:$HOME/Scripts/bin

PATH=$PATH:~/Scripts/

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Get iPython and other programs to work
PATH=$PATH:/Library/Frameworks/Python.framework/Versions/Current/bin

# Get Racket to work
PATH=$PATH:/usr/local/racket

# Add /usr/local/sbin to PATH to stop homebrew from complaining each time
PATH=$PATH:/usr/local/sbin

# MacPorts Installer addition on 2012-09-27_at_01:40:19: adding an appropriate PATH variable for use with MacPorts.
PATH=$PATH:/opt/local/bin:/opt/local/sbin
# Finished adapting your PATH environment variable for use with MacPorts.

# Need my installs in /usr/local/bin to take precedence over ones in /usr/bin
# But first remove it from its current position in PATH
PATH=${PATH/\/usr\/local\/bin:/}
PATH=/usr/local/bin:$PATH

# Include cython in PATH for Python's sake
PATH=$PATH:/Users/gajubhat/Source_Code/cython/bin

# Including Apache Ant & Apache Maven in the PATH variable
# PATH=$PATH:/usr/local/apache-ant:/usr/local/maven:$(/usr/libexec/java_home)

# All additions to the PATH variable go before this line
export PATH

# Set up Python nicely
export PYTHONSTARTUP='/Users/gajubhat/.python/startup.py'
# Include cython in the search path
export PYTHONPATH=$PYTHONPATH:/Users/gajubhat/Source_Code/cython/

# Including libraries for java
# export CLASSPATH=$CLASSPATH:~/Source_Code/Java_Lib/algs4.jar:~/Source_Code/Java_Lib/stdlib.jar:.

# Temporary hack for getting classpath to work with the code in Thinking in java
export CLASSPATH=$CLASSPATH:~/Documents/Work/Code_Pen/java/Thinking_in_Java/TIJ4-code/

# Set up Python nicely
export PYTHONSTARTUP='/Users/gajubhat/.python/startup.py'
# Include cython in the search path
export PYTHONPATH=$PYTHONPATH:/Users/gajubhat/Source_Code/cython/

# Including libraries for java
export CLASSPATH=$CLASSPATH:~/Source_Code/Java_Lib/algs4.jar:~/Source_Code/Java_Lib/stdlib.jar:.
# Setting JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home)

# Temporary hack for getting classpath to work with the code in Thinking in java
export CLASSPATH=$CLASSPATH:/usr/local/lib/jar/:~/Documents/Work/Code_Pen/java/Thinking_in_Java/TIJ4-code/

# Set architecture flags correctly to avoid headaches
export ARCHFLAGS="-arch x86_64"

# Set a global history file for R
export R_HISTFILE=~/.Rhistory

# For docbooks support-brew installed it here
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

# Handling MIT scheme
export MITSCHEME_LIBRARY_PATH="/Applications/MIT\:GNU\ Scheme.app/Contents/Resources"
