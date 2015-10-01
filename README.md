# alpine-vault
Docker image for Hashicorp's Vault app in Alpine linux.

## What is this?
This is a simple docker image that contains Hashicorp's Vault app build in Alpine linux.  All the work
happens in the bootstrap.sh file.  It will do the following:

* Install git, bash, make, golang-1.5.1
* Clones https://github.com/hashicorp/vault
* Builds the vault binary
* Installs the vault binary to /usr/local/bin
* Uninstalls git, make, and go to produce a smaller image
* Deletes the vault source and apk cache
* And finally sets the entrypoint to vault.

## How to Build
Building is pretty easy, just run ```make``` and it will build! For more details read on!

To build manually just run a build command like the following:
```shell
$ docker build -t chosenken/alpine-vault .
```

## How to Run
An example docker run command:

```shell

$ docker run -d --name vault 
  --cap-add IPC_LOCK \
  -v $(pwd)/vault.hcl:/vault.hcl\ 
  -p 8200:8200 -p 8500:8500 \
  -e VAULT_ADDR=http://127.0.0.1:8200 \
  chosenken/alpine-vault server -config /vault.hcl
```
