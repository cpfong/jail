#!/bin/sh
#
# obj: Creating jail Template (note: after buildworld)
#
# how: check handbook of FreeBSD at chapter15 15.5. Updating Multiple Jails
# https://www.freebsd.org/doc/handbook/jails-application.html
# his:
#  2021jan21 base on ./stage1-create_jail_template.2021jan17.txt
#

# global variables
j='/srv/j'
root="/srv/j/mroot"
skel="/srv/j/skel"
js='/srv/js'
w='www' # original use s (stand 4 service), but $s like s (skel), so give it up
# end of global variable

mkdir -p $root
mkdir -p $skel

# crate ZFS file system for jails
zfs create -p zroot$root
zfs set mountpoint=/srv zroot/srv
zfs create -p zroot$skel

# deploy template
cd /usr/src
make installworld DESTDIR=$root
make distribution DESTDIR=$root

# ports just a dir, NO need to actually extract ports.txz in
mkdir $root/usr/ports
cpdup /usr/src $root/usr/src

mkdir $skel/home $skel/usr-X11R6 $skel/distfiles

mv $root/etc $skel
mv $root/usr/local $skel/usr-local
mv $root/tmp $skel
mv $root/root $skel
# there is empty directory need to take care
chflags noschg $root/var/empty
mv $root/var $skel
chflags schg $skel/var/empty

# Use mergemaster to install missing config files. 
# 2 ENTER and 1 q
mergemaster -t $skel/var/tmp/temproot -D $skel -i

# remove extra directories mergemaster created # cp note: say YES to make pwd.DB
# cp's comment: all files this is on mroot which is Read-Only and i am at skel ( Read-Write )

cd $skel
rm -R bin boot lib libexec mnt proc rescue sbin usr dev

cd $root
mkdir s
ln -s s/etc etc
ln -s s/home home
ln -s s/root root
ln -s s/tmp tmp
ln -s s/var var
ln -s ../s/usr-local usr/local
ln -s ../s/usr-X11R6 usr/X11R6
ln -s ../../s/distfiles usr/ports/distfiles

#done with template, now can go to create a jail
