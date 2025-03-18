# PostgreSQL with PostGIS and TimescaleDB

A minimal Docker image based on the official `timescale/timescaledb:latest-pg17` image with the PostGIS extension added.

## Features

- Based on the official TimescaleDB PostgreSQL 17 image
- PostGIS spatial extension added
- Native multi-architecture support: AMD64 and ARM64 (built on native GitHub runners)
- Automated building and updating via GitHub Actions
- Rolling release that stays up to date with the latest versions
- Optimized Alpine-based image for minimal size (approximately 1 GB)

## Usage

```bash
docker pull ghcr.io/kimasplund/docker-images/postgis_timescale:latest
```

The image automatically uses the correct architecture for your system (ARM64 or AMD64).

In a Docker Compose file:

```yaml
services:
  postgres:
    image: ghcr.io/kimasplund/docker-images/postgis_timescale:latest
    environment:
      POSTGRES_PASSWORD: postgres
      POSTGRES_USER: postgres
      POSTGRES_DB: postgres
    ports:
      - "5432:5432"
    volumes:
      - postgres-data:/var/lib/postgresql/data

volumes:
  postgres-data:
```

## Available Tags

- `latest`: Always points to the most recent build (multi-arch)
- `pg17`: PostgreSQL 17 with latest PostGIS and TimescaleDB (multi-arch)
- `latest-amd64`: AMD64-specific image
- `latest-arm64`: ARM64-specific image
- `pg17-amd64`: AMD64-specific PostgreSQL 17 image
- `pg17-arm64`: ARM64-specific PostgreSQL 17 image

## Building Locally

To build the image locally:

```bash
docker build -t postgres-postgis-timescale:custom .
```

## Automatic Updates

This image is automatically rebuilt:
- Weekly via GitHub Actions to incorporate updates from the base TimescaleDB image
- When changes are made to the Dockerfile or workflow
- Using native ARM64 and AMD64 runners for optimal performance and efficiency

## Extensions Enabled

The following extensions are automatically enabled in all databases:
- `postgis`: For spatial data capabilities (3.5.2 or newer)
- `postgis_topology`: For topology support with PostGIS
- `timescaledb`: For time-series data capabilities (pre-installed in the base image)
- `pg_stat_statements`: For query performance monitoring
- `pg_trgm`: For text similarity search and indexing
- `pgcrypto`: For cryptographic functions

## Technical Details

This image uses the Alpine package manager (apk) to install PostGIS directly from Alpine's repositories, resulting in:
- Faster builds compared to compiling from source
- Smaller image size than Debian-based alternatives
- Simplified maintenance with automatic updates

## Why This Image?

The official TimescaleDB image does not include PostGIS, and the official PostGIS image does not include TimescaleDB. This image provides both extensions pre-installed and configured in a single, optimized container.

## License

This project is open source and available under the [MIT License](LICENSE).

## Author

Created and maintained by [Kim Asplund](https://asplund.kim). 