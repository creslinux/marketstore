GOPATH0 := $(firstword $(subst :, ,$(GOPATH)))
all:
	go build -o $(GOPATH0)/bin/testgdax_usd.so -buildmode=plugin .
