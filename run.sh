#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

mkdir -p ./data/prometheus ./data/grafana
sudo chown -R 472:472 ./data/grafana
sudo chown -R 65534:65534 ./data/prometheus

echo "[1/3] Pulling images..."
docker compose pull

echo "[2/3] Starting stack..."
docker compose up -d

echo "[3/3] Status:"
docker compose ps

echo
echo "✅ Up!"
echo "Proxy     → http://localhost:8080"
echo "Grafana   → http://localhost:3000"
echo "Prometheus→ http://localhost:9090"
