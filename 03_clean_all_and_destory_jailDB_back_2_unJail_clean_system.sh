#!/bin/sh

# stop this test jail www if necessary (depend)
echo service jail stop www

#umount
#nullfs
echo sudo umount /srv/j/www/s
echo sudo umount /srv/j/www
#no need since www jail stop already
#echo sudo umount /srv/j/www/dev

echo sudo umount /srv/j/mroot
echo sudo umount /srv/j/skel

echo sudo umount /srv/js
echo sudo umount /srv/j

#end unmount

# destroy zfs DB
echo sudo zfs destroy zroot/srv/js
echo sudo zfs destroy zroot/srv/j/mroot
echo sudo zfs destroy zroot/srv/j/skel
echo sudo zfs destroy zroot/srv/j
echo sudo zfs destroy zroot/srv
# end destroy DB

#clean dir
echo sudo rm -fr /srv/js
echo sudo rm -fr /srv/j
#end clear dir

echo "end of this file"

# mount | grep nullfs
#/srv/j/mroot on /srv/j/www (nullfs, local, read-only)
#/srv/js/www on /srv/j/www/s (nullfs, local)

# mount | grep j
#zroot/srv/js on /srv/js (zfs, local, noatime, nfsv4acls)
#zroot/srv/j on /srv/j (zfs, local, noatime, nfsv4acls)
#zroot/srv/j/mroot on /srv/j/mroot (zfs, local, noatime, nfsv4acls)
#zroot/srv/j/skel on /srv/j/skel (zfs, local, noatime, nfsv4acls)
#/srv/j/mroot on /srv/j/www 	(nullfs, local, read-only)
#/srv/js/www on /srv/j/www/s 	(nullfs, local)
#devfs on /srv/j/www/dev (devfs, local, multilabel)

# zfs list | grep srv
#zroot/srv/js        2.54M  34.4G  2.54M  /srv/js
#zroot/srv/j/mroot   2.91G  34.4G  2.91G  /srv/j/mroot
#zroot/srv/j/skel    2.49M  34.4G  2.49M  /srv/j/skel
#zroot/srv/j         2.91G  34.4G    96K  /srv/j
#zroot/srv           2.91G  34.4G    96K  /srv
