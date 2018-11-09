# What does this all do?

From a "fresh" install of Ubuntu MATE, this will let me set up my
box the way I want to.

# How to use

You'll want to install Ubuntu MATE 18.04, and then run:

```bash
sudo apt install git ansible
git clone https://github.com/jws85/Dotfiles
~/Dotfiles/provision
```

I specify Ubuntu MATE specifically because at this point, I don't
have any interest in working with other window managers, and I am
most used to a Debian-like environment.

I would have recommended installing Ansible in a virtualenv, but
Ansible has some wonkiness when running out of one that prevented
deployments on local machines...

# What does this ultimately install?

When this all finishes, you'll have a nicely configured MATE
environment.

I have an Ansible role, not referenced in any of the playbooks, to
set up a not-quite-configured StumpWM environment.  I keep trying
minimal tiling environments and giving them up after a month.  I'm
keeping it around in the off chance that I might want to putter
around with it again.

# Why not some simpler bash script?

I found a guide that used Ansible, and honestly I wanted to learn a
system automation tool at some point.
