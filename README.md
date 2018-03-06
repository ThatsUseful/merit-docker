# Docker container for Merit Wallet
Docker file for Merit Wallet / Miner

# Build the base
```
docker build -t merit .
docker run -i -t merit:latest
```

# Create dependent Dockerfile and add wallet.dat (if from existing or follow Merit readme)
```
#
# Merit.me
#
FROM merit:latest
MAINTAINER Scott Rutherford <scott@usefulblocks.com>

# Run
CMD supervisord -c /etc/supervisor/supervisord.conf && bash
```

If you mount a local directory for merit in the container then you won't lose your wallet.......
```
docker build -t merit-miner .
docker run -i -t -p 22:22 -v /Users/scott/Workspace/usefulblocks/data:/root/.merit merit-miner:latest
tail -f ./data/debug.log
```

# Connecting to the Docker container
```
docker ps
```

```
CONTAINER ID        IMAGE                COMMAND                  CREATED             STATUS              PORTS               NAMES
f6f4c5c5c28f        merit-miner:latest   "/bin/sh -c 'supervi…"   4 minutes ago       Up 4 minutes                            kind_curran
```

```
docker exec -it f6f bash
```

# Helpful commands
```
watch -n5 merit-cli getblockchaininfo
```
