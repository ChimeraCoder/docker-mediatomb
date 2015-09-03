#!/usr/bin/env bash
#
# Place this file 'csfpost.sh' into /usr/local/csf/bin/
#

# Restart Docker after CSF restart
/usr/bin/env service docker restart

#---------------------------------------- IPTables for MediaTomb to be seen by UPnP player
# MediaTomb : My UPnP player can not see MediaTomb, what is wrong?
# http://mediatomb.cc/dokuwiki/faq:faq

# UPnP uses IGMP multicast to find media servers.  Accept IGMP broadcast packets
iptables -A INPUT -i eth1 -d 239.0.0.0/8 -p igmp -j ACCEPT
#----------------------------------------/IPTables for MediaTomb to be seen by UPnP player
