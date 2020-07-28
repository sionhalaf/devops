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

run_copy_sshkeys()
{

	echo sleep 90
	sleep 90
	#while [ 1 ] ; do
		#echo ping -c5 $REMOTE_HOST
	#	ping -c5 $REMOTE_HOST 
	#	if [ $? = 0 ] ; then 
			echo su vagrant -c "sshpass -p vagrant ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@192.168.100.11"
			su vagrant -c "sshpass -p vagrant ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@192.168.100.11"
			#sshpass -p vagrant ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@192.168.100.11
			echo $?
			echo done sshpass

			su vagrant -c "ssh $REMOTE_HOST uptime"
#		else	

#			echo sleep 5
#			sleep 5
#		fi
#	done

	#echo su vagrant -c "ssh $REMOTE_HOST uptime"
	#su vagrant -c "ssh $REMOTE_HOST uptime"

}

run_copy_sshkeys &

