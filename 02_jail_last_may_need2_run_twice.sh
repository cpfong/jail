#!/bin/sh

j='/srv/j'
js='/srv/js'
root='/srv/j/mroot'
skel='/srv/j/skel'
w='www' # original use s (stand 4 service), but $s like s (skel), so give it up

#these 2 always FAIL on previous, so separate it out to this file
#cannot figure why
# move these 2 lines out from ./01_create_one_jail.sh
#
####### ATTENTATION!!! #######################
# if first time FAIL, just do it AGAIN, it will pass!!

echo mount -t nullfs -o rw ${js}/$w $j/$w/s
echo cpdup ${skel} ${js}/$w

echo "if every things go well, you can start www by typing service jail start www"

# done with setup www jail, next you can start www using:
# service jail start www
