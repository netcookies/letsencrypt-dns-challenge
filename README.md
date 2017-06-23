# letsencrypt-dnspod-hook-docker
Related project https://github.com/ftao/letsencrypt-dnspod-hook

# Build docker images

```
./build.sh
```

# Usage

```
cat > ldhd <<EOF
#!/bin/sh
docker run ldhd $1
EOF
```
