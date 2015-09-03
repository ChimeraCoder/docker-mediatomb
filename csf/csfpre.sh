#!/usr/bin/env bash
#
# Place this file 'csfpre.sh' into /usr/local/csf/bin/
#

#---------------------------------------- IPTables for MediaTomb to be seen by UPnP player
# MediaTomb : My UPnP player can not see MediaTomb, what is wrong?
# http://mediatomb.cc/dokuwiki/faq:faq

# Special case to allow 0.0.0.0 source for UPnP to use IGMP to
# register clients with media servers and routers.
iptables -A INPUT -i eth1 -s 0.0.0.0/32 -d 224.0.0.1/32 -p igmp -j ACCEPT

# Any firewall code to limit eth1 input traffic to the appropriate IP subnets
# must come AFTER the above special case.
#----------------------------------------/IPTables for MediaTomb to be seen by UPnP player
