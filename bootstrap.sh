#!/bin/sh

# Paths used for vault
export GOROOT=/usr/lib/go/
export GOPATH=/root/go
export VAULT_PATH=$GOPATH/src/github.com/hashicorp/vault
export PATH=$PATH:$GOPATH/bin

# Install required componenents for building
apk --update add git bash make
# Install go from edge so we get go 1.5.1
apk --update --repository http://alpine.gliderlabs.com/alpine/edge/main/ add go

# Clone vault
mkdir -p $VAULT_PATH
git clone https://github.com/hashicorp/vault $VAULT_PATH
cd $VAULT_PATH

# Compile vault
make bootstrap
make dev

# Install vault to /usr/loca/bimn
cp $GOPATH/bin/vault /usr/local/bin/vault

# Remove uneeded packages
apk del git make go

#  Clean directories
cd /root
rm -rf $GOPATH /usr/share/man /tmp/* /var/cache/apk/*
