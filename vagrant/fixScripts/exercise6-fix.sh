#!/bin/bash
#add fix to exercise6-fix here
if [ ${#@} -lt 2 ] ; then
  echo "Usage: $0 file1 file2 file..  target"
  echo "there should be at least 1 source and 1 destination"
  echo "last argument is the destination for copy"
  exit
fi

HOST=$(hostname)
if [ `hostname` = "server1" ] ; then
   HOST="server2"
else
   HOST="server1"
fi

echo scp  "${@:1:($#-1)}"  "$HOST":${@: -1}
scp  "${@:1:($#-1)}"  "$HOST":${@: -1}

echo "the number of bytes is `stat --printf="%s" ${@:1:$#-1}`"
