#!/bin/bash

PKG=$1
URL=$2


resp=$(curl -qSfsw '\n%{http_code}' -d '{"username":"sonata","password":"1234"}' http://sp.int3.sonata-nfv.eu:32001/api/v2/sessions)
echo "User sonata logged in: $resp"
token=$(echo $resp | awk '{json=$1 FS $2 FS $3; print json}' | python -mjson.tool | grep "access_token" | awk -F ':[ \t]*' '{print $2}' | sed 's/,//g' | sed 's/"//g')
echo "TOKEN="$token 




comilla="\""

#Result=$(curl -v -i -X POST -H "Authorization:Bearer $token" -F ""package=@/media/sf_compartida/sonata-empty-service.son"" ""http://sp.int3.sonata-nfv.eu:32001/api/v2/packages"")

Result=$(curl -v -i -X POST -H "Authorization:Bearer $token" -F ""package=@$PKG"" ""$URL"")

echo
echo
echo RESULT:
echo $Result
echo
echo
