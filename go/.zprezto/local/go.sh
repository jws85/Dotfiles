# Now that go modules are a thing, I'm moving the GOPATH to a hidden
# location and making it non-configurable, bwahahahaha
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/.config/go
export PATH=$PATH:$GOPATH/bin
