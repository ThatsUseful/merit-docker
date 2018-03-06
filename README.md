# merit-docker
Docker file for Merit Wallet / Miner

```
docker build -t merit .
docker run -i -t merit:latest
```

```
#
# Merit.me
#
FROM merit:latest
MAINTAINER Scott Rutherford <scott@usefulblocks.com>

# Run
CMD supervisord -c /etc/supervisor/supervisord.conf && bash
```
