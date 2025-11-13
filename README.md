# Grafana + Prometheus + NGINX — bridge network & host data

- Uses Docker's default **bridge** network via `network_mode: bridge` (no user-defined networks).
- Persists data on the host:
  - Prometheus → `./data/prometheus`
  - Grafana    → `./data/grafana`

**Note:** On the default `bridge`, container-name DNS across projects is not provided. NGINX proxies to Grafana via the host's published port using `host.docker.internal` (we add `extra_hosts` automatically).

## Quick start
```bash
cp env.sample .env
mkdir -p data/prometheus data/grafana
docker compose --env-file .env up -d
```

- NGINX → http://localhost:8080/
- Grafana → http://localhost:3000/
- Prometheus → http://localhost:9090/
- Health → http://localhost:8080/healthz
