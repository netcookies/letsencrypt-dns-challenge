# Related project

* https://github.com/lukas2511/dehydrated
* https://github.com/AnalogJ/lexicon

# Usage

## Make docker command as a native CLI

```
echo "alias dehydrated='\
      docker rm -f dehydrated > /dev/null 2>&1; \
      docker run --name dehydrated \
      -v /etc/dehydrated/domains.txt:/app/domains.txt \
      --env-file /etc/dehydrated/domains.env \
      netcookies/letsencrypt-dns-challenge \
      '" >> ~/.bashrc
```

## Put domains.txt and domains.env in /etc/dehydrated

Examples of domains.txt https://github.com/lukas2511/dehydrated/blob/master/docs/examples/domains.txt

Examples of domains.env 

```
# dehydrated
CHALLENGETYPE="dns-01"
CONTACT_EMAIL=netcookies@gmail.com

# lexicon
# More available environment https://github.com/AnalogJ/lexicon#environmental-variables
PROVIDER=dnspod
LEXICON_DNSPOD_USERNAME='APIID'
LEXICON_DNSPOD_TOKEN='YOURTOKEN'
```

More available environment https://github.com/AnalogJ/lexicon#environmental-variables


## Run 

```
dehydrated --register --accept-terms
dehydrated -c
```
