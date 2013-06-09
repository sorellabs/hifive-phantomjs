bin = $(shell npm bin)
browserify = $(bin)/browserify lib/index.js
lsc = $(bin)/lsc

lib: src/*.ls
	$(lsc) -o lib -c src/*.ls

build/test: test/*.js
	mkdir build/test -p
	cp test/*.js build/test

build/test/specs: build/test test/specs/*.ls
	$(lsc) -o build/test/specs -c test/specs/*.ls

build/lib: src/*.ls
	$(lsc) -o build/lib -c src/*.ls

dist/brofist-phantomjs.umd.js: dist lib
	mkdir dist -p
	$(browserify) --standalone brofist-phantomjs > $@

pretest: build/lib build/test build/test/specs

prepublish: lib

bundle: dist/brofist-phantomjs.umd.js

clean:
	rm -rf dist build lib

test: pretest
	node ./build/test/node.js

test-browser: pretest
	brofist-browser serve build/test/specs

.PHONY: test test-browser
