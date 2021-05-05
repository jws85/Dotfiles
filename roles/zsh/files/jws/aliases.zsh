# Open files with 'open'
alias open=mimeopen

# Sudo with $
alias \$=sudo

# If exa (https://the.exa.website) is set up, use that for ll
# Otherwise just use plain ol' ls
if type exa > /dev/null; then
  alias ll='exa -l --git'
else
  alias ll='ls -hal'
fi
