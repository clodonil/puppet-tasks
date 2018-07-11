#!/bin/bash

cp /PuppetServer/pe.conf /usr/local/src/
tar -xzvf /PuppetServer/puppet-enterprise-2018.1.2-el-7-x86_64.tar.gz -C /usr/local/src/
/usr/local/src/puppet-enterprise-2018.1.2-el-7-x86_64/puppet-enterprise-installer -c /usr/local/src/pe.conf

/opt/puppetlabs/bin/puppet agent -t 
/opt/puppetlabs/bin/puppet agent -t 

rpm -Uvh https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm
yum install -y  puppet-bolt

