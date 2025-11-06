#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

sudo systemctl start docker

mkdir -p ./data/prometheus ./data/grafana
sudo chown -R 472:472 ./data/grafana
sudo chown -R 65534:65534 ./data/prometheus

echo "[1/3] Pulling images..."
sudo docker compose pull

echo "[2/3] Starting stack..."
sudo docker compose up -d

echo "[3/3] Status:"
sudo docker compose ps

echo
echo "✅ Up!"
echo "Proxy     → http://localhost:8080"
echo "Grafana   → http://localhost:3000"
echo "Prometheus→ http://localhost:9090"
