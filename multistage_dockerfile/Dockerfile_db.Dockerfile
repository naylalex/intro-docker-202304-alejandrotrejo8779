FROM postgres

COPY words.sql /docker-entrypoint-initdb.d


EXPOSE 5432


ENV POSTGRES_HOST_AUTH_METHOD=trust

