#!/usr/bin/env bash

echo "Getting IPv4..."
sleep 2s
SEASIDE_IP=$(curl -s http://ipecho.net/plain)
echo $SEASIDE_IP
sleep 2s
curl -v --header "Content-type: application/json" --request POST --data '{"secretapikey":"'"$PORKBUN_API_SECRETKEY"'","apikey":"'"$PORKBUN_API_KEY"'"}' https://api-ipv4.porkbun.com/api/json/v3/dns/retrieve/iot.js | jq
sleep 2s
curl -v --header "Content-type: application/json" --request POST --data '{"secretapikey":"'"$PORKBUN_API_SECRETKEY"'","apikey":"'"$PORKBUN_API_KEY"'"}' https://api-ipv4.porkbun.com/api/json/v3/dns/delete/iot.js/338135641 | jq
sleep 2s
curl -v --header "Content-type: application/json" --request POST --data '{"secretapikey":"'"$PORKBUN_API_SECRETKEY"'","apikey":"'"$PORKBUN_API_KEY"'","content":"'$SEASIDE_IP'","name":"*","type":"A","ttl":"600"}' https://api-ipv4.porkbun.com/api/json/v3/dns/create/iot.js | jq
sleep 2s
echo "Complete"
