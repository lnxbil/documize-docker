# Pull Alpine Linux just for chmodding downloaded file
FROM alpine as builder
ARG version

ADD https://github.com/documize/community/releases/download/v${version}/documize-community-linux-amd64 /app
RUN chmod +x /app


# actual container
FROM scratch
ARG version
LABEL version "v${version}"

COPY --from=builder /app /app
ENTRYPOINT [ "/app" ]
