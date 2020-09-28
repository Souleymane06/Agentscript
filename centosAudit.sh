#!/bin/bash

#Description: Centos7 Audit
#Author: Souleymane D
#Date:

echo -e "\n************************\n" >> /var/log/centos7audit-$(date +%F)
echo -e "\n**** Centos 7 Audit ******\n" >> /var/log/centos7audit-$(date +%F)
echo -e "\n**************************\n" >> /var/log/centos7audit-$(date +%F)

## Check hosts file
echo -e "\n check the host file" >> /var/log/centos7audit-$(date +%F)
if [ -f /etc/hosts ] ; then
echo "File /etc/host exist" >> /var/log/centos7audit-$(date +%F)
else
echo "File /etc/host does not exist" >> /var/log/centos7audit-$(date +%F)
fi
 ## Check Selinux
echo -e "\n checking selinux\n" >> /var/log/centos7audit-$(date +%F)
echo -e "\n The selinux is set to $(getenforce) \n" >> /var/log/centos7audit-$(date +%F)

## nobody users uid

echo -e  "\n checking nobody's uid\n"
echo "The user nobody's uid is $(grep ^nobody /etc/passwd|awk -F: '{print$3}')" >> /var/log/centos7audit-$(date +%F)

## Check for samba package

echo -e "\n checking samba package\n" >> /var/log/centos7audit-$(date +%F)
rpm -qa |grep samba  >/dev/null 2>&1

if [ $? -eq 0 ] ; then
echo -e "\n package samba installed\n" >> /var/log/centos7audit-$(date +%F)
else
echo -e "\n package samba is not installed\n" >> /var/log/centos7audit-$(date +%F)
fi

## check for curl package

echo -e "\n checking curl package\n" >> /var/log/centos7audit-$(date +%F)
rpm -qa |grep curl  >/dev/null 2>&1

if [ $? -eq 0 ] ; then
echo -e "\n package curl installed\n" >> /var/log/centos7audit-$(date +%F)
else
echo -e "\n package curl is not installed\n" >> /var/log/centos7audit-$(date +%F)
fi

## check for docker package

echo -e "\n checking docker package\n" >> /var/log/centos7audit-$(date +%F)
rpm -qa |grep docker  >/dev/null 2>&1

if [ $? -eq 0 ] ; then
echo -e "\n package docker installed\n" >> /var/log/centos7audit-$(date +%F)
else
echo -e "\n package docker is not installed\n" >> /var/log/centos7audit-$(date +%F)
fi

## checking the auditd
echo -e "\n checking the auditd\n" >> /var/log/centos7audit-$(date +%F)

systemctl status auditd | grep Loaded | awk -F";" '{print " auditd is"$2}' >> /var/log/centos7audit-$(date +%F)
systemctl status auditd | awk 'NR ==3 {print "auditd is " $3}' | tr -d '()' >> /var/log/centos7audit-$(date +%F)


## Check network file
echo -e "\n check the network file" >> /var/log/centos7audit-$(date +%F)
if [ -f /etc/sysconfig/network ] ; then
echo "File /etc/sysconfig/network exist" >> /var/log/centos7audit-$(date +%F)
else
echo "File /etc/sysconfig/network does not exist" >> /var/log/centos7audit-$(date +%F)
fi

#### Check hostname
echo -e "\n The hostname for this server is $(hostname) \n"

### check system bits

echo -e "\n the system is $(getconf LONG_BIT) \n" >> /var/log/centos7audit-$(date +%F)

##


