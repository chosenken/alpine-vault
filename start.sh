#!/bin/bash

docker run -d --name vault --cap-add IPC_LOCK -v $(pwd)/vault.hcl:/vault.hcl -p 8200:8200 -p 8500:8500 -e VAULT_ADDR=http://127.0.0.1:8200 chosenken/alpine-vault server -config /vault.hcl
