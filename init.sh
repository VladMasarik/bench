#!/bin/bash
set -ev

if [ -z ${BENCH+x} ]; then
  BENCH="Benchmark_myFunc5"
fi

curl g.co

echo $PATH

export PATH="$PATH:/home/travis/.gimme/versions/go1.12.5.linux.amd64/bin:/home/travis/gopath/bin"

pwd
ls -lav

which go

go build -o a.out && ./a.out
go get -u golang.org/x/tools/...
echo $COMMENT
echo ${BENCH}
go test -bench ${COMMENT} -v ./... > old.txt
go test -bench ${COMMENT} -v ./... > new.txt
#benchcmp old.txt new.txt > out.txt


echo $COMMENTS_URL

COMMENT=$(cat new.txt)
PAYLOAD=$(jq --arg body "$COMMENT" '{body: $body}')
echo $COMMENT
echo $PAYLOAD
curl -s -S -H "Authorization: token $GITHUB_TOKEN" --header "Content-Type: application/json" --data "$PAYLOAD" "$COMMENTS_URL" > /dev/null