FROM elixir:1.10.2-alpine as builder

ENV MIX_ENV=prod

WORKDIR /opt/app

RUN apk update && \
  apk upgrade --no-cache && \
  apk add --no-cache \
    nodejs \
    yarn \
    git \
    build-base && \
  mix local.rebar --force && \
  mix local.hex --force

COPY . .

RUN mix do deps.get, deps.compile, compile

RUN \
  mkdir -p /opt/built && \
  mix release --path /opt/built

FROM alpine:latest
ENV POSTGRES_URL=ecto://postgres:postgres@localhost/alertas_prod
ENV MIX_ENV=prod
ENV REPLACE_OS_VARS=true

RUN apk update && \
    apk add --no-cache \
      bash \
      openssl-dev

WORKDIR /opt/app
COPY --from=builder /opt/built .

CMD trap 'exit' INT; /opt/app/bin/production start
