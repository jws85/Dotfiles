# What does this all do?

From a "fresh" install of Ubuntu Server/Ubuntu MATE 20.04, this will let me
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
- `dev-desktop`: Everything in `min-desktop` + `build` + `docker` +
  `emacs` + `mpd`
- `full-desktop`: Everything in `dev-desktop` + `games`

On subsequent runs, `LEVEL` can be omitted.

# What does this ultimately install?

The Ansible playbook names are self-explanatory.

If you install one of the desktop playbooks, it'll set up `i3` and
friends.

Because this is all implemented as one big Ansible setup, there is
a hard requirement for Ansible, though I really need to investigate
using its capability to install stuff remotely...

## Why did you switch away from Pop_OS/GNOME?

I installed Pop\_OS sometime in 2020 at a point where I was happily
 hacking away on a reasonably recent laptop (an X260).

A little prior to Christmas 2020, my X260 started experiencing GPU
failures, and all I had on hand at the time was... a Raspberry Pi 4.
Pop\_OS isn't even *intended* for non-x86\_64 architectures.  I ended
up flashing an Ubuntu Server image and plopping my old i3 configs in
place.

Moreover... I am increasingly interested in computer environments
that are

1. simple and clean
2. performant
3. can run on low-power boxen like a Raspberry Pi

i3 fits this all a lot better!  However, I've historically done a lot
of desktop environment jumping, and I'm sure it'll happen again... I
hope not...

# Why not some simpler bash script instead of Ansible?

I found a guide that used Ansible, and honestly I wanted to learn a
system automation tool at some point.

Ansible generally works well, but I have run into glitches sometimes
as can be expected by a tool that essentially has to do 'everything.'
It's also pretty heavy -- a big Python app.  Right now I'm installing
it inside of a `pipx` virtualenv, so at least it's not totally
infecting my installs!

I briefly looked into replacing Ansible with `Makefiles` or with bash
scripts and realized that I was losing out on a *lot* of
functionality and work that was "already done for me."

# What remains untested?

On 20.04:

- `kvm`
- `games`
