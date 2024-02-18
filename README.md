# transactions-deployment

![](https://github.com/shaolin182/transactions-java/workflows/integration-test/badge.svg)

Aim of this project is to deploy transaction app
Several configuration can exists depending on technologies

# KeyCloak Configuration

- Create 'transactions' realm
- Import clients configurations
  - ./keycloak/transactions-api.json
  - ./keycloak/transactions-client.json
- Create client scope 'reader' and 'writer' and associate it to client configuration
- Create a role 'transaction-reader'
- Create a user 
  - set its password
  - associate it to role 'transaction-reader'

# Handle database dumps

## Dump database
```shell
mongorestore --db=transactions --collection=transaction dump/transaction.bson
```

## Restore database

Copy last dump into pod

```shell
kubectl cp dump/20230616/ kubtransactions/mongo-5bc55dc5f9-gbndx:/dump
```

From inside pod
```shell
mongorestore --db=transactions --collection=transaction dump/transaction.bson
```
# Docker compose
```shell
CONFIG_PRIVATEKEY=$(cat ./env/id_rsa) docker compose -f docker-compose-local.yml --env-file ./env/.env.dev up -d
```

# Ansible Configuration

## Run playbook

```shell
# Install
ansible-playbook transactions-deploy-playbook.yml -i inventory --ask-vault-pass

# Uninstall
ansible-playbook transactions-undeploy-playbook.yml -i inventory --ask-vault-pass
```