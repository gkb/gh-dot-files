PATH=$PATH:~/Scripts/
export PATH

# Set up Python nicely
export PYTHONSTARTUP='/Users/gajubhat/.python/startup.py'
# Include cython in the search path
export PYTHONPATH=$PYTHONPATH:/Users/gajubhat/Source_Code/cython/
export PATH=$PATH:/Users/gajubhat/Source_Code/cython/bin

# Including libraries for java
# export CLASSPATH=$CLASSPATH:~/Source_Code/Java_Lib/algs4.jar:~/Source_Code/Java_Lib/stdlib.jar:.

# Temporary hack for getting classpath to work with the code in Thinking in java
export CLASSPATH=$CLASSPATH:~/Documents/Work/Code_Pen/java/Thinking_in_Java/TIJ4-code/
