# Docker container for Merit Mining
Docker file for Merit Wallet / Miner

# Build the base
```
docker build -t merit .
docker run -i -t merit:latest
```

# Create dependent Dockerfile and add wallet.dat
```
#
# Merit.me
#
FROM merit:latest
MAINTAINER Scott Rutherford <scott@usefulblocks.com>

# Run
CMD supervisord -c /etc/supervisor/supervisord.conf && bash
```
