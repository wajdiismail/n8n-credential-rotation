#!/bin/bash
# Test script for n8n-credential-rotation
set -e

echo "Testing secret rotation..."
kubectl get secret backend-secrets -n default -o json | jq '.data | map_values(@base64d)'

echo "Testing deployment restart..."
kubectl rollout restart deployment/backend-test -n default
kubectl rollout status deployment/backend-test -n default

echo "Testing pod logs..."
kubectl logs -l app=backend-test -n default --tail=20

echo "Test complete."
