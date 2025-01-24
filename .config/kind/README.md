# Install Kind

# Create cluster
kind create cluster --config=kind-ingress-conf.yaml

# Ingress NGINX Controller
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

Source : https://kind.sigs.k8s.io/docs/user/ingress/#ingress-nginx

# Node labels
kubectl get nodes --show-labels
kubectl label nodes kind-control-plane storage=local
