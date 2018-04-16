# Related project

* https://github.com/lukas2511/dehydrated
* https://github.com/AnalogJ/lexicon

# Usage

## Make alias wrapper for docker command

```
echo "alias dehydrated='docker rm -f dehydrated > /dev/null 2>&1; docker run --name dehydrated -v /etc/dehydrated/:/etc/dehydrated/ netcookies/letsencrypt-dnspod'" >> ~/.bashrc
```

## Donwload and edit [config example](https://github.com/lukas2511/dehydrated/blob/master/docs/examples/config)

```
# config path   /etc/dehydrated/config
dehydrated -c --accept-terms
```

## SET Environment in config.sh

```
#!/bin/sh

export PROVIDER=dnspod
export LEXICON_DNSPOD_USERNAME='APIID'
export LEXICON_DNSPOD_TOKEN='YOURTOKEN'
```
