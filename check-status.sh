#!/bin/bash

URL="http://localhost"
MAILTO="muroslavkl@gmail.com"

while true; do
    RESPONSE=$(curl -Is $URL | head -n 1 | cut -d' ' -f2)
    if [[ $RESPONSE != 2* && $RESPONSE != 3* ]]; then
        MESSAGE="HTTP response status code: $RESPONSE at $(date)" 
        echo $MESSAGE >> error.log
        echo $MESSAGE | mail -s "Error on $URL" $MAILTO
    fi
    sleep 30
done