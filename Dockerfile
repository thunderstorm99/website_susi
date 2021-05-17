FROM klakegg/hugo:0.83.1 AS builder
COPY config.toml /app/
COPY themes/ /app/themes
WORKDIR /app
RUN hugo

FROM nginx:1.20.0
COPY --from=builder /app/public /usr/share/nginx/html
