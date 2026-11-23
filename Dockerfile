# LastSignal on Railway: the official ghcr.io/giovantenne/lastsignal:1.1.1 image (MIT), application unmodified.
# Railway layer: runs as root so the Rails app can write the root-owned Railway volume at /rails/storage
# (SQLite + Solid Queue/Cache), Thruster listens on 8080 behind Railway's proxy, and the non-secret defaults are baked in.
FROM ghcr.io/giovantenne/lastsignal:1.1.1
LABEL org.opencontainers.image.source="https://github.com/onepush-dev/lastsignal"
USER 0:0
ENV RAILS_ENV=production \
    HTTP_PORT=8080 \
    SOLID_QUEUE_IN_PUMA=true \
    SMTP_PORT=587 \
    SMTP_FROM_NAME=LastSignal \
    PROCESS_CHECKINS_INTERVAL_MINUTES=60
EXPOSE 8080
