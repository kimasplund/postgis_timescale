FROM timescale/timescaledb:latest-pg17

LABEL maintainer="Kim Asplund <kim.asplund@gmail.com>"
LABEL org.opencontainers.image.source="https://github.com/kimasplund/Docker-Images/postgis_timescale"

# Add community repository where postgis is available
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

# Install postgis directly from Alpine package and additional extensions
RUN apk update && \
    apk add --no-cache postgis postgresql-contrib && \
    rm -rf /var/cache/apk/*

# Create symlink to make PostGIS work with PostgreSQL
RUN mkdir -p /usr/local/lib/postgresql && \
    ln -s /usr/lib/postgresql17/postgis-3.so /usr/local/lib/postgresql/postgis-3.so && \
    ln -s /usr/lib/postgresql17/postgis_topology-3.so /usr/local/lib/postgresql/postgis_topology-3.so && \
    mkdir -p /usr/local/share && \
    ln -s /usr/share/postgresql17 /usr/local/share/postgresql

# Update shared_preload_libraries to include pg_stat_statements
RUN sed -i "s/shared_preload_libraries = 'timescaledb'/shared_preload_libraries = 'timescaledb,pg_stat_statements'/" /usr/local/share/postgresql/postgresql.conf.sample

# Create initialization scripts to enable extensions
RUN echo "CREATE EXTENSION IF NOT EXISTS postgis;" > /docker-entrypoint-initdb.d/10-postgis.sql && \
    echo "CREATE EXTENSION IF NOT EXISTS postgis_topology;" > /docker-entrypoint-initdb.d/11-postgis-topology.sql && \
    echo "CREATE EXTENSION IF NOT EXISTS pg_stat_statements;" > /docker-entrypoint-initdb.d/20-pg-stat-statements.sql && \
    echo "CREATE EXTENSION IF NOT EXISTS pg_trgm;" > /docker-entrypoint-initdb.d/21-pg-trgm.sql && \
    echo "CREATE EXTENSION IF NOT EXISTS pgcrypto;" > /docker-entrypoint-initdb.d/22-pgcrypto.sql

EXPOSE 5432

CMD ["postgres"] 