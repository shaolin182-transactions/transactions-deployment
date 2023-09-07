# Install

## Bitnami last es version
```shell
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install transactions-es bitnami/elasticsearch --version 19.10.6 -n elasticsearch --create-namespace
helm uninstall transactions-es
```

## 7.8.1 vesrion official

```shell
helm repo add elastic https://helm.elastic.co
helm install transactions-es --version 7.8.1 elastic/elasticsearch -n elasticsearch --create-namespace
helm uninstall transactions-es
```