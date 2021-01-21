#!/bin/sh

m='/mnt'	#mount point
f='b.txz'	#base system tar file
s='foo'		#jail service name

zfs create -p zroot/srv/jails/$s
zfs set mountpoint=$m zroot/srv
fetch ftp://ftp.freebsd.org/pub/FreeBSD/releases/amd64/amd64/12.2-RELEASE/base.txz -o /tmp/$f
tar xf /tmp/$f -C $m/jails/$s
rm /tmp/$f

#~ # zfs create -p zroot/srv/jails/bsd-test01
#~ # zfs set mountpoint=/srv zroot/srv
#~ # fetch ftp://ftp.freebsd.org/pub/FreeBSD/releases/amd64/amd64/11.1-RELEASE/base.txz -o base-11.1-RELEASE.txz 
#~ # tar xf base-11.1-RELEASE.txz -C /srv/jails/bsd-test01
