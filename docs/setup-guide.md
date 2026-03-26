# Setup Guide

This guide walks you through setting up the automated credential rotation system using n8n, PostgreSQL, and Kubernetes.

## Prerequisites
- n8n instance (v2.7.4+)
- PostgreSQL (v13+)
- Kubernetes cluster (v1.24+)
- SMTP server for email notifications

## 1. Kubernetes Setup
- Apply the service account and RBAC:
  ```sh
  kubectl apply -f k8s/service-account.yaml
  ```
- Retrieve the service account token for n8n:
  ```sh
  kubectl get secret n8n-rotator-token -n default -o jsonpath='{.data.token}' | base64 --decode
  ```
- Deploy your application and secret using `k8s/deployment.yaml` and `k8s/secret.yaml`.

## 2. n8n Workflow Import
- Import `workflow/credential-rotation.json` into n8n.
- Configure environment variables and credentials as needed.

## 3. Email Setup
- Configure SMTP credentials in n8n for notifications.

## 4. Testing
- Use `scripts/test.sh` to simulate rotation and failure scenarios.

See `docs/troubleshooting.md` for common issues.
