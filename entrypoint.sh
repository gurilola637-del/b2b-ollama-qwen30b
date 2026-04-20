 #!/bin/sh
  set -eux

  : "${OLLAMA_HOST:=0.0.0.0:11434}"
  export OLLAMA_HOST

  ollama serve > /var/log/ollama-serve.log 2>&1 &
  sleep 10

  ollama pull qwen3:30b-a3b

  exec /usr/local/bin/cloudflared tunnel --url http://localhost:11434 --no-autoupdate
