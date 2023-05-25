FROM flyio/litestream-base:latest as litestream

FROM ghost:4

RUN apt-get update && apt-get install -y ca-certificates

COPY --from=litestream /litestream /litestream
ENV DATABASE_URL=/var/lib/ghost/content/data/ghost.db

ADD start_ghost.sh /usr/local/bin/

RUN ghost config url https://jawa-blog.fly.dev/

CMD [ "/litestream/start.sh" , "start_ghost.sh"]