#!/bin/bash
set -ev

curl g.co
go get -u golang.org/x/tools/...
go build -o a.out && ./a.out
echo $BENCH
echo ${BENCH}
go test -bench ${BENCH} -v ./... > old.txt
go test -bench ${BENCH} -v ./... > new.txt
benchcmp old.txt new.txt > out.txt
apt-get install jq -qq

COMMENT=$(cat out.txt)
PAYLOAD=$(echo '{}' | jq --arg body "$COMMENT" '.body = $body')
echo $COMMENT
echo $PAYLOAD
curl -s -S -H "Authorization: token $GITHUB_TOKEN" --header "Content-Type: application/json" --data "$PAYLOAD" "$COMMENTS_URL" > /dev/null