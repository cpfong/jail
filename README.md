# jail
jail nat/ipfw without vnet at FreeBSD12.2

it is hard to write a shell to do the jail stuff, however i certainly can write a memo.
one have to read lots of other people article to implement your own way to do jail.

i install my jail on FreeBSD12.2 at Vultr.com with 55G hd and 2G RAM 1cpu.
file system is ZFS (read FreeBSD handbook chapter20 is enough), and my jail article is under https://www.ifong.org/cpfong/docs/jail.html
i personally cannot work it out in short period time, i just gather information here and there then build up my own jail system

steps as following:
1. buildworld, buildkernel
2. common (template) jail setup
3. build one jail
4. network (the most complicate part)
