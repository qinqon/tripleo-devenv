#!/bin/bash -e
keys_dir=$1
key_name=id_rsa
key=$keys_dir/$key_name
if [ ! -f $keys_dir/id_rsa ]
then
        echo "Generating ssh keys"
        ssh-keygen -q -t rsa -N '' -f $key
fi
echo "Installing ssh keys"
mkdir -p ~/.ssh/
cp -f $key* ~/.ssh/
bash
