FROM python:3.9-slim

WORKDIR /app

# Git is needed so the container can commit the README update
RUN apt-get update && apt-get install -y --no-install-recommends git ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . /app

RUN chmod +x /app/.github/scripts/entrypoint.sh

ENTRYPOINT ["/app/.github/scripts/entrypoint.sh"]
