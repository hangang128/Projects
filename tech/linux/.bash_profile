# java home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home
export PATH=~/bin:$JAVA_HOME/bin:$PATH

# gradle home
export GRADLE_HOME=/opt/local/share/java/gradle

# scala home
export SCALA_HOME=/Users/paul.han/lib/scala-2.10.4
export PATH=$PATH:$SCALA_HOME/bin
 
# for hadoop
export HADOOP_HOME=/Users/paul.han/lib/hadoop-2.4.0
export PATH=$HADOOP_HOME/bin:$PATH:$HADOOP_HOME/sbin

# for pig
export PIG_INSTALL=/Users/paul.han/lib/pig-0.12.1
export PATH=$PATH:$PIG_INSTALL/bin
export PIG_CLASSPATH=$HADOOP_HOME/etc/hadoop

# for macports
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

export PATH=~/lib/oozie-4.0.1/bin:$PATH

export PS1="[\u@\h \[\033[1;36m\]\W\[\033[0m\]]\$ "

if [ -x /usr/bin/git ]; then
	if [ "$NON_GIT" == "" ]; then
	    source ~/lib/git-completion.bash
	fi
fi

source ~/.local_alias.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
