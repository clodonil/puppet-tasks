#!/bin/bash

echo "" > /root/.ssh/config

while read line
do
   ip=$(echo $line | awk {'print $1'})
   host=$(echo $line | awk {'print $2'})

   echo "Host $host" >> /root/.ssh/config
   echo "    HostName $ip" >> /root/.ssh/config
   echo "    User vagrant" >> /root/.ssh/config
   echo "    Port 22" >> /root/.ssh/config
   echo "    PasswordAuthentication no" >> /root/.ssh/config
   echo "    IdentityFile /vagrant/insecure_private_key" >> /root/.ssh/config
   echo "    IdentitiesOnly yes" >> /root/.ssh/config
   echo "    LogLevel FATAL" >> /root/.ssh/config
   echo "    ForwardAgent yes" >> /root/.ssh/config
done  < /etc/hosts
