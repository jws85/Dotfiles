# What does this all do?

From a "fresh" install of Ubuntu Server/Pop_OS 20.04, this will let me
set up my box the way I want to.

# How to use

You'll want to install one of the two distros above, and then run:

```bash
git clone https://github.com/jws85/Dotfiles
~/Dotfiles/provision LEVEL
```

`LEVEL` can be (the below refer to Ansible roles):

- `server`: `base` , `kvm`, and `docker`
- `build`: `base` and `build`
- `min-desktop`: `base`, `desktop`, and `gnome`
- `dev-desktop`: Everything in `min-desktop` + `build` + `docker`
- `full-desktop`: Everything in `dev-desktop` + `games`

On subsequent runs, `LEVEL` can be omitted.

# What does this ultimately install?

At the moment, this will add some programs I like to the stock
install.  Pop_OS' tiling stuff on GNOME 3 makes it usable enough for
my needs.

(Historically, I've used MATE, i3, and StumpWM.  I tend to bounce off
minimal tiling WMs because I invariably run into dbus hell and get
frustrated with that...  The code for all of the above happens to
still be in this repo... at some point I'll probably purge it.
Maybe.)

# Why not some simpler bash script?

I found a guide that used Ansible, and honestly I wanted to learn a
system automation tool at some point.

# What remains untested?

On 20.04:

- `kvm`
- `games`
