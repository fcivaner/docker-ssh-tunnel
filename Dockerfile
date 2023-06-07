FROM alpine:3.2
LABEL maintainer="Fırat Civaner (https://github.com/fcivaner)"

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*

CMD echo $SSH_PRIVATE_KEY | sed 's/\\n/\n/g' > /keyfile \
    && set -x \
    && chmod 600 /keyfile \
    && ssh \
    -vv \
    -NTC \
    -o ServerAliveInterval=60 \
    -o GatewayPorts=true \
    -o ExitOnForwardFailure=yes \
    -i /keyfile \
    -o StrictHostKeyChecking=no \
    -L *:$LOCAL_PORT:$REMOTE_HOST:$REMOTE_PORT \
    $TUNNEL_USER@$TUNNEL_HOST
