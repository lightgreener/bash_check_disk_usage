scenario : check all your server and find the usage of each disk, if usage greater than 80%,
then send  a warning letter


command    describe

df -h   report file system disk space usage

awk '/^\//{print $NF"="$5}'   describe: before {} , condition expression
					inside {} , $NF is the last column. 
						    if comma in between, there is space
						    "=" link data of two column
awk -v ip=$IP 'ip==$1{print $5}'    describe: -v is set available
					      ip equals first param then print fifth param
						    

${a%=*}  means only get key, left side of =
${a#*=}  means only get value, right side of =

echo -e "***"      -e means there is a special charactor in following content. 
