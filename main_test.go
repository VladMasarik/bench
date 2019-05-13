package main

import "testing"

func Benchmark_myFunc5(b *testing.B) {
	for n := 0; n < b.N; n++ {
		myFunc(5)
	}
}

func Benchmark_myFunc10(b *testing.B) {
	for n := 0; n < b.N; n++ {
		myFunc(10)
	}
}

func Benchmark_myFunc15(b *testing.B) {
	for n := 0; n < b.N; n++ {
		myFunc(15)
	}
}