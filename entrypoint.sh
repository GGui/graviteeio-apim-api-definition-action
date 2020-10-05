#!/bin/sh -l
set -e -o pipefail
 
cmd=$1
api=$2
workspace=$3
options=$4


if [ ! -e ${dir} ]; then
    echo "${dir}: No such file or directory exists";
    exit 1;
fi


case $cmd in
     "version") gio --version;;
     "diff"|"apply") 
        echo "Executing: gio apim apis definition $cmd --api=${api} $options --def-path=${dir}/$workspace"
        gio apim apis definition $cmd --api=$api $ops --def-path=$workspace
        ;;
     * ) echo "gio $cmd is not supported." && exit 1 ;;
esac





