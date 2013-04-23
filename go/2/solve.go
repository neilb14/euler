package main

import (
	"fmt"
)

func fibonnaci() func() int {
	last, current := 0,1
	return func() int {
		last, current = current, last + current
		return last
	}
}

func main() {
	f := fibonnaci()
	for i:=0; i<10; i++ {
		fmt.Printf("%d ", f())
	}
}