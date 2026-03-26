# Architecture

## Overview
This system automates PostgreSQL credential rotation and Kubernetes secret synchronization using n8n workflows.

### Components
- **n8n**: Orchestrates the workflow (schedule, DB, K8s, email)
- **PostgreSQL**: Target database for credential rotation
- **Kubernetes**: Stores secrets and runs deployments
- **SMTP**: Sends notifications on failure

### Workflow Steps
1. Schedule trigger (monthly)
2. Fetch active users from PostgreSQL
3. Loop through users
4. Generate secure password
5. Update PostgreSQL password
6. Base64 encode credentials
7. Patch Kubernetes secret
8. Restart deployment
9. Send error email if any step fails

### Security
- Minimal RBAC permissions
- Strong password generation
- No password logging
- HTTPS for all API calls
- Audit trail via n8n

See the main README and setup guide for more details.
