# Troubleshooting

## Common Issues

| Issue                        | Likely Cause                | Solution                                                      |
|-----------------------------|-----------------------------|---------------------------------------------------------------|
| 401 Unauthorized            | Token expired               | Regenerate token: `kubectl create token n8n-rotator -n default --duration=8760h` |
| 404 Not Found                | Secret/deployment missing   | Create missing resource manually                              |
| Connection Refused           | Wrong API endpoint          | Check with `kubectl cluster-info`                             |
| SSL Certificate Error        | Self-signed cert            | Enable "Ignore SSL Issues" in HTTP node                       |
| PostgreSQL Connection Failed | Wrong credentials           | Verify PostgreSQL credentials in n8n                           |
| Emails Not Sending           | SMTP misconfigured          | Test SMTP separately first                                    |

## Validation Commands
- Check secret: `kubectl get secret backend-secrets -n default -o json | jq '.data | map_values(@base64d)'`
- Restart deployment: `kubectl rollout restart deployment/backend-test -n default`
- Check deployment status: `kubectl rollout status deployment/backend-test -n default`
- View pod logs: `kubectl logs -l app=backend-test -n default --tail=20`
