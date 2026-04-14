FROM mongo:7.0-jammy

COPY scripts/init-blog.js /docker-entrypoint-initdb.d/

EXPOSE 27017

USER mongodb