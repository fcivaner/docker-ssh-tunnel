# docker-ssh-tunnel

Configuration for a docker image which establishes an ssh tunnel for a single port. The SSH key is provided through an environment variable.

## Usage

### With docker-compose

Important: Newline characters in the TUNNEL_SSH_KEY variable must be represented as \n.

```yaml
version: "2.4"

services:
  ssh-tunnel:
    image: "fcivaner/docker-ssh-tunnel"
    environment:
      SSH_PRIVATE_KEY: ${TUNNEL_SSH_KEY:?}
      TUNNEL_HOST: ${TUNNEL_HOST:?}
      TUNNEL_USER: ${TUNNEL_USER:?}
      REMOTE_HOST: localhost
      LOCAL_PORT: 5672
      REMOTE_PORT: 5672
    expose:
      - "5672"
    ports:
      - "5672:5672"
```
