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