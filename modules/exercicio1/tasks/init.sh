#!/bin/bash

interface=$PT_interface
ip=$(/sbin/ip add show $interface | grep "inet\b" | awk '{print $2}' | cut -d / -f 1 )
echo "$interface:$ip"
