#!/bin/env bash

# check each usage of every server
# Centos 7
# Henry
# 03/06/2021

# set a available which contains info of ip address, user, port
HOST_INFO=host.info
for IP in $(awk '/^\//'{print $1}' $HOST_INFO); do
	USER=$(awk -v ip=$IP 'ip==$1{print $2}'   $HOST_INFO) 
	PORT=$(awk -v ip=$IP 'ip==$1{print $3}'   $HOST_INFO) 
	TMP_FILE=/tmp/disk.tmp
	ssh -p $PORT $USER@$IP 'df -h' >$TMP_FILE
	# same as above
	# ssh $USER@$IP 'df -h' >$TMP_FILE
	USAGE_LIST=$(awk '/^\//{print $NF"="int($5)}'  $TMP_FILE)
	for USAGE in USAGE_LIST; do
		MOUNTED_NAME=${USAGE%=*}
		USAGE=${USAGE#*=}
		if [ $USAGE -gt 80   ]; then
			echo -e "$IP \n $MOUNTED_NAME  partition usage over 80% "
		
		else
			echo " it is fine "
		fi	
	done
done





