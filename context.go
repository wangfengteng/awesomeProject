package main

import "fmt"

func main() {
	fmt.Println(test(1,2,add))
}

func test(a, b int,back CallBack) int{
	return back(a,b)
}

func add ( a, b int) int{
	return a+b
}

type CallBack func( a, b int) int

func testabcd(a, b int,back CallBack) int{
	return back(a,b)
}
