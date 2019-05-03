# This Makefile is just for building the release distribution.
# It's not needed for just building or running the program.

PROGRAM=jl-mat2str2
VERSION=$(shell cat VERSION)
FILES=Mcode LICENSE README.md

.PHONY: dist
dist:
	mkdir -p dist/${PROGRAM}-${VERSION}
	cp -r $(FILES) dist/${PROGRAM}-${VERSION}
	rm -f dist/${PROGRAM}-${VERSION}/*.DS_Store
	cd dist; tar czf ${PROGRAM}-${VERSION}.tgz --exclude='*.DS_Store' ${PROGRAM}-${VERSION}
	cd dist; zip -rq ${PROGRAM}-${VERSION}.zip ${PROGRAM}-${VERSION} -x '*.DS_Store'

.PHONY: clean
clean:
	rm -rf dist/*
