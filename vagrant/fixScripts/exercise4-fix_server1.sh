#!/bin/bash
echo exe4 `hostname`
echo "192.168.100.10 server1" >> /etc/hosts
echo "192.168.100.11 server2" >> /etc/hosts

echo cat /etc/hosts
cat /etc/hosts
