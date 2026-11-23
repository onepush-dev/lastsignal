# LastSignal on Railway

[LastSignal](https://github.com/giovantenne/lastsignal) (MIT): a self-hosted, end-to-end encrypted dead man's switch. It checks in with you by email; if you stop responding, your encrypted messages are delivered to the recipients you chose. Deploy it on Railway with one click.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/-6Gy7K)

## What this template runs
- **lastsignal**: `ghcr.io/onepush-dev/lastsignal:1.1.1`, the official `ghcr.io/giovantenne/lastsignal:1.1.1` image (application unmodified; runs as root so it can write the Railway volume). Rails + Thruster on port 8080, health check `/up`, Solid Queue runs inside Puma. One volume at `/rails/storage` holds the SQLite databases.

## Variables
| Variable | Value |
|---|---|
| `SECRET_KEY_BASE` | generated secret |
| `APP_BASE_URL` | `https://${{RAILWAY_PUBLIC_DOMAIN}}` |
| `SMTP_DOMAIN` | `${{RAILWAY_PUBLIC_DOMAIN}}` (HELO domain) |
| `SMTP_HOST` | **your SMTP server** (e.g. smtp-relay.brevo.com, smtp.resend.com) |
| `SMTP_USER` | **your SMTP username** |
| `SMTP_PASS` | **your SMTP password / API key** |
| `SMTP_FROM_EMAIL` | **sender address verified with your SMTP provider** |

LastSignal signs you in with magic links and sends check-ins by email, so the four SMTP values are the only things you enter. Baked defaults: `SMTP_PORT=587` (STARTTLS), `SMTP_FROM_NAME=LastSignal`, `PROCESS_CHECKINS_INTERVAL_MINUTES=60`. Railway only allows outbound SMTP on paid plans (Hobby and up).

Lock the instance to yourself by adding `ALLOWED_EMAILS=you@example.com` (comma-separated) to the service variables; otherwise anyone who reaches the URL can request a magic link.

Not affiliated with LastSignal.
