FROM alpine

RUN  apk add --no-cache cargo git openssl-dev && git clone https://github.com/matrix-org/matrix-ircd /matrix-ircd && cd /matrix-ircd && \
     cargo build && mv /matrix-ircd/target/debug/matrix-ircd /usr/local/bin && rm -rf /matrix-ircd

ENTRYPOINT  ["matrix-ircd"]

