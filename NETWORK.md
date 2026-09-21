# Network Findings

## Environment

Network connectivity and TLS egress were tested from my development environment as part of the Enterprise Dev Environment setup.

## Egress Test

| Host | Purpose | DNS | TLS | Certificate Issuer |
|---|---|---|---|---|
| pypi.org | Python packages | Pass | Pass | GlobalSign nv-sa |
| api.openai.com | Model API | Pass | Pass | Google Trust Services |
| cdn.jsdelivr.net | CDN | Pass | Pass | Sectigo Limited |
| huggingface.co | Open model weights | Pass | Pass | Amazon |
| registry-1.docker.io | Container images | Pass | Pass | Amazon |
| github.com | Repository access | Pass | Pass | Sectigo Limited |

All six tested hosts resolved successfully through DNS and accepted outbound TLS connections.

## Proxy and Certificate Environment

No proxy or custom certificate environment variables were detected.

The following variables were checked:

- HTTP_PROXY / HTTPS_PROXY / NO_PROXY
- http_proxy / https_proxy / no_proxy
- REQUESTS_CA_BUNDLE
- SSL_CERT_FILE
- CURL_CA_BUNDLE
- NODE_EXTRA_CA_CERTS

## Findings

The current network allows outbound HTTPS/TLS connectivity to all six services tested by the course environment check.

The certificates presented during the test were issued by standard public certificate authorities or cloud providers. No obvious evidence of TLS interception or an explicitly configured corporate proxy was observed in these tests.