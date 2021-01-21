#!/bin/sh
# obj: Creating jail Template (note: after buildworld)
#
# how: check handbook of FreeBSD at chapter15 15.5. Updating Multiple Jails
# https://www.freebsd.org/doc/handbook/jails-application.html
# his:
#  2021jan21 base on ./stage1-create_jail_template.2021jan17.txt
#

# global variables exactly like the previous (DO NOT modify it!)
j='/srv/j'
root="/srv/j/mroot"
skel="/srv/j/skel"
js='/srv/js'
w='www' # original use s (stand 4 service), but $s like s (skel), so give it up
# end of global variable

# start for one jail here (now use www)
mkdir -p $j/$w/s
mount -t nullfs -o ro $root $j/$w

mkdir -p ${js}/$w
zfs create zroot${js} #only 1st time
