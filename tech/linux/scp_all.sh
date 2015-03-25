#!/bin/bash

usage="Usage: scp_all diff/cp/t_sync nn/dn/all [src] [remote_dest]"
verb=$1
hosts=$2
src_path=$3

if [[ "" == "$4" ]] ; then
	dest_path=$src_path
else
	dest_path=$4
fi

if [[ "nn" == "$hosts" ]] ; then
  HOSTS="248 249"
elif [[ "dn" == "$hosts" ]] ; then
  HOSTS="242 244 245 246 247"
elif [[ "all" == "$hosts" ]] ; then
  HOSTS="242 243 244 245 246 247 248 249"
else
  echo "invalid hosts $hosts"
	echo $usage
  exit 2
fi

if [[ "$verb" == "cp" ]] ; then
	echo "Continue to copy files to all hosts in group $hosts ? Y/ctrl-c "
	read answer
fi

for j in $HOSTS
do
  echo "processing host $j"
  if [[ "diff" == "$verb" ]] ; then
   cmd="ssh ip-10-222-0-$j cat $dest_path | diff $src_path - | more"
  elif [[ "cp" == "$verb" ]] ; then
   cmd="scp $src_path ip-10-222-0-$j:$dest_path"
 elif [[ "t_sync" == "$verb" ]] ; then
	 cmd="ssh ip-10-222-0-$j date $(ssh ip-10-222-0-243 date '+%m%d%H%M%Y.%S' )"
  else
    echo "invalid command $verb"
    exit 1
  fi
  echo "$cmd"
  eval $cmd
  echo 
done
