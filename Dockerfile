FROM postgres:13-alpine
ARG FILE=dump.tar
ARG POSTGRES_USER=postgres
ARG POSTGRES_PASSWORD=example
ENV POSTGRES_USER=${POSTGRES_USER}
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
COPY ${FILE} /
RUN docker-entrypoint.sh postgres & sleep 5 ; pg_restore -U ${POSTGRES_USER} -C -d postgres < ${FILE} ; su -c "psql -U ${POSTGRES_USER} -c CHECKPOINT && pg_ctl stop -m fast" postgres
EXPOSE 5432
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["postgres"]