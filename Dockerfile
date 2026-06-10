FROM alpine:latest

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
    && curl -L -H "Cache-Control: no-cache" -o /v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
    && mkdir /v2raybin \
    && unzip /v2ray.zip -d /v2raybin \
    && chmod +x /v2raybin/v2ray \
    && rm -rf /v2ray.zip

COPY config.json /v2raybin/config.json

CMD ["/v2raybin/v2ray", "run", "-config", "/v2raybin/config.json"]
