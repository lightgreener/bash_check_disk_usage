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
	ssh $


done



