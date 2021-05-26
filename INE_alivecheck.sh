#!/bin/bash

for protocol in 'http://' 'https://'; do
    while read line; do
        code=$(curl -L --write-out "%{http_code}" --output /dev/null --silent --insecure $protocol$line)
    if [ $code = "000" ]; then
        echo "$protocol$line: Not responding."
    else
        echo "$protocol$line: HTTP $code"
        echo "$protocol$line: $code" >> alive.txt # output alive servers to .txt file
    done < domains.txt. # list of domains that we want to check
done
