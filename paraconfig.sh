#!/bin/bash

## PARACONFIG ##
basedir=$(dirname $0)

echo "Paraconfig (c) Pedro Amador 2014-2016"
echo

# Check parameters
if [ "$#" -ne 1 ]
then
  echo "Usage: $0 [destination_host]" >&2
  echo "Example: $0 mail" >&2
  exit 1
fi

# Copy SSH key
ssh-copy-id $1
if [ $? -ne 0 ]
then
	result=$?
	echo "Error copying ssh key"
	exit $result
fi

# Copy apt cacher config
rsync -a /etc/apt/apt.conf $1:/etc/apt/apt.conf &> /dev/null
# Copy client config script
scp $basedir/_pcclient $1:/tmp/pc_client.sh
# Execute client config script
ssh -A -t $1 "bash /tmp/pc_client.sh"
exit $?
