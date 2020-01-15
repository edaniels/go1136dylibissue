package main

/*
#cgo CFLAGS: -I${SRCDIR}/../dylib/include
#cgo LDFLAGS: -L${SRCDIR}/../dylib/lib -lfoo
#include "foo.h"
*/
import "C"
import "log"

func main() {
	log.Print(DoWork())
}

func DoWork() int {
	return int(C.do_work())
}
