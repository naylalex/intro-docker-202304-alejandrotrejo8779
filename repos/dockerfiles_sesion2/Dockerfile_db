FROM postgres

COPY words.sql /docker-entrypoint-initdb.d

ENV POSTGRES_HOST_AUTH_METHOD=trust

