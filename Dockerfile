FROM crystallang/crystal:0.36.1-alpine-build as builder

RUN apk add crystal shards

WORKDIR /builder

COPY . .

RUN crystal build --release src/chat.cr -o application

WORKDIR /app

FROM alpine:3.13.2

RUN apk add --no-cache gmp libgc++ libevent pcre

COPY --from=builder /builder/application .

EXPOSE 3000

CMD ["./application"]
