# shell control
export HISTCONTROL=ignoredups:ignorespace
export HISTTIMEFORMAT="%h %d %H:%M:%S> "
export HISTIGNORE="edit_alias*:refresh_alias*"
export PROMPT_COMMAND="${PROMPT_COMMAND}printf '\e]0;\a';"

# alias
alias ll="ls -la"
## Show hidden files ##
alias l.='ls -d .* --color=auto'

alias mkdir='mkdir -pv'

# handy short cuts #
alias h='history'
alias j='jobs -l'


# ssh -DN 20050 aws-nn1
alias dfs='hdfs dfs'

#ssh -A -L 50070:localhost:50070 aws-nn1

alias aws_ff="ssh -A -L 1444:localhost:1444 -L 5000:localhost:5000 -L 7000:localhost:7000 -L 8080:localhost:8080 -L 8443:localhost:8443 -L 9000:localhost:9000 developer@i-21cd8a7e.workdayomsuv.com"


alias gobda='cd /Users/paul.han/workspace/svn/bigdata/bda-workflow'

alias trim="sed -e 's/^[[:space:]]*//g' -e 's/[[:space:]]*\$//g'"

remove_host_line() {
	sed -i '' $1d ~/.ssh/known_hosts
}

# create second skype instances
alias skype_second='sudo /Applications/Skype.app/Contents/MacOS/Skype'

# tunnel alias
oozieNode="node1081"
alias tunnel_1074='ssh -f -N -L 9222:localhost:22 node1074'
alias tunnel_1075="ssh -f -N -L 9333:localhost:22 $oozieNode"
alias tunnel_suv='ssh -fNL *:17101:localhost:17010 root@i-f98a2af6.workdaysuv.com'
alias tunnel_1083_443='ssh -fNL *:8443:localhost:443 node1083'
alias tunnel_1083='ssh -f -N -L 9444:localhost:22 node1083'

alias tunnel_aws_nn1='ssh -f -N -L 9555:localhost:22 aws-nn1'

alias 1074='ssh -p 9222 localhost'
alias 1075='ssh -p 9333 localhost'
alias proxy_aws='ssh -ND 20050 aws-nn1  &'
alias proxy_node1075="ssh -ND 20058 $oozieNode  &"
alias proxy_svt="ssh -ND 20068 41  &"

alias tunnel_list="ps -ef | egrep '9222|9333|20058' | grep -v 'grep' "
alias tunnel_kill="ps -eo pid,command | egrep '9222|9333|20058' | grep -v 'grep' |  awk '{print \$1}' | xargs  kill"
sss(){ ssh -t $1 "sudo su -";}
tunnel_pdxeng() {
	num_ssh=`tunnel_list | wc -l|trim`
	if [[ "$num_ssh" == "3" ]] ; then
		echo "tunnels are all up ... $num_ssh. no action is needed."
		tunnel_list
		return
	fi
	echo "Reset tunnels due to less sufficient tunnels #: $num_ssh. Tunnel kill started .. "
	tunnel_kill
	echo "tunnel 1074"
	tunnel_1074;echo "tunnel 1075";tunnel_1075;echo "proxy 20058"; proxy_node1075
	echo "available tunnels:"
	tunnel_list
}

reset_eclipse() {
set -x	
cd ~/workspace/cdh500_ws/
mv org.eclipse.core.resources org.eclipse.core.resources.bak
mv .metadata/.plugins/org.eclipse.core.resources .metadata/.plugins/org.eclipse.core.resources.bak
echo "please wait. start and exit eclipse now."
open -a Eclipse
sleep 20
osascript -e 'tell application "Eclipse" to quit'
rm -rf .metadata/.plugins/org.eclipse.core.resources 
mv .metadata/.plugins/org.eclipse.core.resources.bak/ .metadata/.plugins/org.eclipse.core.resources
rm .metadata/.plugins/org.eclipse.core.resources/.snap
sleep 5
echo "start eclipse again, it should work."
open -a Eclipse
sleep 5
set +x
}

alias refresh_alias='source ~/.local_alias.sh'
alias edit_alias='mate ~/.local_alias.sh'
export MYTEST=`cat ~/tmp/myTEST`
alias sync_history='history -a; history -n'
