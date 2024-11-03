# Contribute to transactions-deployment

## Prerequisites

On your local machine, install those tools
- docker
- kubectl
- kind (Kubernetes in Docker)

### Install kubectl
https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management

### Install Kind
https://kind.sigs.k8s.io/docs/user/quick-start/#installing-from-release-binaries

## Deploy a k8s cluster on local machine

```shell
# Create cluster
kind create cluster --config=.config/kind/kind-ingress-conf.yaml

# Ingress NGINX Controller, source https://kind.sigs.k8s.io/docs/user/ingress/#ingress-nginx
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

# Add labels to node for storage
kubectl label nodes kind-control-plane storage=local
```