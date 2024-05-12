# transactions-deployment

![](https://github.com/shaolin182/transactions-java/workflows/integration-test/badge.svg)

Aim of this project is to deploy transaction app
Several configuration can exist depending on technologies

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

# Administration

## Operations on database

Connect to database by following those commands
```shell
# First exec into pod
kubectl exec -it <pod-name> -n <namespace> -- bash

# Connect to database
mongosh
```

When connecting to database, there are some queries to read/update records
```shell
# switch database
use transactions

# Query all records from 'transaction' collection
db.transaction.find()

# Query records by id
db.transaction.find({"_id": ObjectId("663e492584cd2707beeb96bf")})

# Query records by category and year
db.transaction.find({'transactions.category._id':  82, '$expr': {"$eq": [{"$year": "$date"}, 2022]}})

# Count records filtered by category and year
db.transaction.find({'transactions.category._id':  82, '$expr': {"$eq": [{"$year": "$date"}, 2022]}}).count()

# Update one record - Change its category
db.transaction.updateOne(
   {"_id": ObjectId("663e492584cd2707beeb96bf")},
   { $set: { "transactions.$[].category": {"_id": 86, "category": "Vacances", "label":"2024 - Auvergne", "type":"EXTRA"}}}
)
  
# Update multiple records
db.transaction.updateMany(
	{'transactions.category._id':  85, '$expr': {"$eq": [{"$year": "$date"}, 2024]}},
    	{ $set: { "transactions.$[].category": { "_id": 85, "category" : "Vacances", "label" : "2024 - Vendée", "type": "EXTRA"}}}
)
```