#!/bin/bash
set -ev

if [ -z ${BENCH+x} ]; then
  BENCH="Benchmark_myFunc5"
fi

curl g.co

echo $PATH

pwd
ls -lav

which go

go build -o a.out && ./a.out
go get -u golang.org/x/tools/...
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