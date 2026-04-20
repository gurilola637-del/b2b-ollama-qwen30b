FROM ollama/ollama:latest

  RUN apt-get update \
   && apt-get install -y --no-install-recommends curl ca-certificates \
   && rm -rf /var/lib/apt/lists/*

  RUN curl -fsSL -o /usr/local/bin/cloudflared \
        https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 \
   && chmod +x /usr/local/bin/cloudflared

  COPY entrypoint.sh /entrypoint.sh
  RUN chmod +x /entrypoint.sh

  EXPOSE 11434
  ENTRYPOINT ["/entrypoint.sh"]
