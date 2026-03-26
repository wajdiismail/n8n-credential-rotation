#!/bin/bash
# Setup script for n8n-credential-rotation
set -e

echo "Applying Kubernetes manifests..."
kubectl apply -f ../k8s/service-account.yaml
kubectl apply -f ../k8s/secret.yaml
kubectl apply -f ../k8s/deployment.yaml

echo "Retrieving n8n-rotator service account token:"
kubectl get secret n8n-rotator-token -n default -o jsonpath='{.data.token}' | base64 --decode
echo -e "\nToken above: configure this in n8n HTTP Request nodes."

echo "Setup complete."
