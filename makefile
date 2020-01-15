test: ./dylib/lib/libfoo.dylib
	# go run should fail
	-LD_LIBRARY_PATH=`pwd`/dylib/lib go run github.com/edaniels/go1136dylibissue/cmd

	# go build and execute should work
	go build -o=./cmd/main github.com/edaniels/go1136dylibissue/cmd
	LD_LIBRARY_PATH=`pwd`/dylib/lib ./cmd/main

	# go run should work on tag go1.13.6 built from source on macos 10.15.2
	LD_LIBRARY_PATH=`pwd`/dylib/lib GOROOT=/usr/local/gogit /usr/local/gogit/bin/go run github.com/edaniels/go1136dylibissue/cmd

./dylib/lib/libfoo.dylib:
	mkdir -p dylib/lib
	gcc -dynamiclib dylib/src/foo.c -o dylib/lib/libfoo.dylib
	install_name_tool -id "@rpath/libfoo.dylib" dylib/lib/libfoo.dylib

clean:
	rm -rf dylib/lib/libfoo.dylib
