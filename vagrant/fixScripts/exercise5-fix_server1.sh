#!/bin/bash
HOST=$(hostname)
echo exercise5 $HOST

if [ $HOST = "server1" ] ; then
   REMOTE_HOST="server2"
else
   REMOTE_HOST="server1"
fi

echo "192.168.100.10 server1" >> /etc/hosts
echo "192.168.100.11 server2" >> /etc/hosts
cat /etc/hosts

#install sshpass
sudo apt-get install sshpass

#generate config file 
echo "Host *" > /home/vagrant/.ssh/config
echo "   StrictHostKeyChecking no" >> /home/vagrant/.ssh/config
chmod 400   /home/vagrant/.ssh/config
chown vagrant:vagrant /home/vagrant/.ssh/config

#verify config file
echo ls -l /home/vagrant/.ssh/config
ls -l /home/vagrant/.ssh/config
echo config file:
cat /home/vagrant/.ssh/config

echo ssh-keygen
su vagrant -c 'echo y |ssh-keygen -f /home/vagrant/.ssh/id_rsa -N ""'
ls -l  /home/vagrant/.ssh/
