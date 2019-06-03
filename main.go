package main

import "fmt"

func main() {
	b := 0
	for i := 0; i < 5; i++{
		b = myFunc(i)
	}
	fmt.Println("result is ", b)
}

func myFunc(x int) int{
	v := 5
	x = v * x
	return x*x
}

// body='{
// 	"request": {
// 	"message": "Override the commit message: this is an api request",
// 	"branch":"master",
// 	"config": {
// 	  "env": {
// 		"matrix": ["TEST=unit"]
// 	  },
// 	  "script": "echo FOO"
// 	 }
//    }}'
   
//    curl -s -X POST \
// 	-H "Content-Type: application/json" \
// 	-H "Accept: application/json" \
// 	-H "Travis-API-Version: 3" \
// 	-H "Authorization: token xxxxxx" \
// 	-d "$body" \
// 	https://api.travis-ci.com/repo/travis-ci%2Ftravis-core/requests
