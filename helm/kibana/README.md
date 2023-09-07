# Install

```shell
# Pre requis
helm repo add bitnami https://charts.bitnami.com/bitnami

# Install
helm install my-kibana bitnami/kibana --version 10.4.6 -n kibana --create-namespace -f values.yaml

# Uninstall
helm uninstall my-kibana
```