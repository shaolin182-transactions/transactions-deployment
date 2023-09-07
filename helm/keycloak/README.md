Auparavant, déployer le PV et le PVC

```shell
# Install keycloak
helm install -f values.yaml -f values-secrets.yaml keycloak -n keycloak --create-namespace keycloak-15.1.7.tgz
```