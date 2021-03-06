.PHONY: plugins

GOPATH0 := $(firstword $(subst :, ,$(GOPATH)))
UTIL_PATH := github.com/alpacahq/marketstore/utils

all:
	go install -ldflags "-s -X $(UTIL_PATH).Tag=$(DOCKER_TAG) -X $(UTIL_PATH).BuildStamp=$(shell date -u +%Y-%m-%d-%H-%M-%S) -X $(UTIL_PATH).GitHash=$(shell git rev-parse HEAD)" ./...

install: all

generate:
	make -C SQLParser
	go generate $(shell find . -path ./vendor -prune -o -name \*.go -exec grep -q go:generate {} \; -print | while read file; do echo `dirname $$file`; done | xargs)

vendor:
	go mod vendor

update:
	go mod tidy

plugins:
	$(MAKE) -C contrib/binance_usdt_50
	$(MAKE) -C contrib/binance_usdt_49
	$(MAKE) -C contrib/binance_usdt_48
	$(MAKE) -C contrib/binance_usdt_47
	$(MAKE) -C contrib/binance_usdt_46
	$(MAKE) -C contrib/binance_usdt_45
	$(MAKE) -C contrib/binance_usdt_44
	$(MAKE) -C contrib/binance_usdt_43
	$(MAKE) -C contrib/binance_usdt_42
	$(MAKE) -C contrib/binance_usdt_41
	$(MAKE) -C contrib/binance_usdt_40
	$(MAKE) -C contrib/binance_usdt_39
	$(MAKE) -C contrib/binance_usdt_38
	$(MAKE) -C contrib/binance_usdt_37
	$(MAKE) -C contrib/binance_usdt_36
	$(MAKE) -C contrib/binance_usdt_35
	$(MAKE) -C contrib/binance_usdt_34
	$(MAKE) -C contrib/binance_usdt_33
	$(MAKE) -C contrib/binance_usdt_32
	$(MAKE) -C contrib/binance_usdt_31
	$(MAKE) -C contrib/binance_usdt_30
	$(MAKE) -C contrib/binance_usdt_29
	$(MAKE) -C contrib/binance_usdt_28
	$(MAKE) -C contrib/binance_usdt_27
	$(MAKE) -C contrib/binance_usdt_26
	$(MAKE) -C contrib/binance_usdt_25
	$(MAKE) -C contrib/binance_usdt_24
	$(MAKE) -C contrib/binance_usdt_23
	$(MAKE) -C contrib/binance_usdt_22
	$(MAKE) -C contrib/binance_usdt_21
	$(MAKE) -C contrib/binance_usdt_20
	$(MAKE) -C contrib/binance_usdt_19
	$(MAKE) -C contrib/binance_usdt_18
	$(MAKE) -C contrib/binance_usdt_17
	$(MAKE) -C contrib/binance_usdt_16
	$(MAKE) -C contrib/binance_usdt_15
	$(MAKE) -C contrib/binance_usdt_14
	$(MAKE) -C contrib/binance_usdt_13
	$(MAKE) -C contrib/binance_usdt_12
	$(MAKE) -C contrib/binance_usdt_11
	$(MAKE) -C contrib/binance_usdt_10
	$(MAKE) -C contrib/binance_usdt_9
	$(MAKE) -C contrib/binance_usdt_8
	$(MAKE) -C contrib/binance_usdt_7
	$(MAKE) -C contrib/binance_usdt_6
	$(MAKE) -C contrib/binance_usdt_5
	$(MAKE) -C contrib/binance_usdt_4
	$(MAKE) -C contrib/binance_usdt_3
	$(MAKE) -C contrib/binance_usdt_2
	$(MAKE) -C contrib/binance_eth_50
	$(MAKE) -C contrib/binance_eth_49
	$(MAKE) -C contrib/binance_eth_48
	$(MAKE) -C contrib/binance_eth_47
	$(MAKE) -C contrib/binance_eth_46
	$(MAKE) -C contrib/binance_eth_45
	$(MAKE) -C contrib/binance_eth_44
	$(MAKE) -C contrib/binance_eth_43
	$(MAKE) -C contrib/binance_eth_42
	$(MAKE) -C contrib/binance_eth_41
	$(MAKE) -C contrib/binance_eth_40
	$(MAKE) -C contrib/binance_eth_39
	$(MAKE) -C contrib/binance_eth_38
	$(MAKE) -C contrib/binance_eth_37
	$(MAKE) -C contrib/binance_eth_36
	$(MAKE) -C contrib/binance_eth_35
	$(MAKE) -C contrib/binance_eth_34
	$(MAKE) -C contrib/binance_eth_33
	$(MAKE) -C contrib/binance_eth_32
	$(MAKE) -C contrib/binance_eth_31
	$(MAKE) -C contrib/binance_eth_30
	$(MAKE) -C contrib/binance_eth_29
	$(MAKE) -C contrib/binance_eth_28
	$(MAKE) -C contrib/binance_eth_27
	$(MAKE) -C contrib/binance_eth_26
	$(MAKE) -C contrib/binance_eth_25
	$(MAKE) -C contrib/binance_eth_24
	$(MAKE) -C contrib/binance_eth_23
	$(MAKE) -C contrib/binance_eth_22
	$(MAKE) -C contrib/binance_eth_21
	$(MAKE) -C contrib/binance_eth_20
	$(MAKE) -C contrib/binance_eth_19
	$(MAKE) -C contrib/binance_eth_18
	$(MAKE) -C contrib/binance_eth_17
	$(MAKE) -C contrib/binance_eth_16
	$(MAKE) -C contrib/binance_eth_15
	$(MAKE) -C contrib/binance_eth_14
	$(MAKE) -C contrib/binance_eth_13
	$(MAKE) -C contrib/binance_eth_12
	$(MAKE) -C contrib/binance_eth_11
	$(MAKE) -C contrib/binance_eth_10
	$(MAKE) -C contrib/binance_eth_9
	$(MAKE) -C contrib/binance_eth_8
	$(MAKE) -C contrib/binance_eth_7
	$(MAKE) -C contrib/binance_eth_6
	$(MAKE) -C contrib/binance_eth_5
	$(MAKE) -C contrib/binance_eth_4
	$(MAKE) -C contrib/binance_eth_3
	$(MAKE) -C contrib/binance_eth_2
	$(MAKE) -C contrib/binance_btc_50
	$(MAKE) -C contrib/binance_btc_49
	$(MAKE) -C contrib/binance_btc_48
	$(MAKE) -C contrib/binance_btc_47
	$(MAKE) -C contrib/binance_btc_46
	$(MAKE) -C contrib/binance_btc_45
	$(MAKE) -C contrib/binance_btc_44
	$(MAKE) -C contrib/binance_btc_43
	$(MAKE) -C contrib/binance_btc_42
	$(MAKE) -C contrib/binance_btc_41
	$(MAKE) -C contrib/binance_btc_40
	$(MAKE) -C contrib/binance_btc_39
	$(MAKE) -C contrib/binance_btc_38
	$(MAKE) -C contrib/binance_btc_37
	$(MAKE) -C contrib/binance_btc_36
	$(MAKE) -C contrib/binance_btc_35
	$(MAKE) -C contrib/binance_btc_34
	$(MAKE) -C contrib/binance_btc_33
	$(MAKE) -C contrib/binance_btc_32
	$(MAKE) -C contrib/binance_btc_31
	$(MAKE) -C contrib/binance_btc_30
	$(MAKE) -C contrib/binance_btc_29
	$(MAKE) -C contrib/binance_btc_28
	$(MAKE) -C contrib/binance_btc_27
	$(MAKE) -C contrib/binance_btc_26
	$(MAKE) -C contrib/binance_btc_25
	$(MAKE) -C contrib/binance_btc_24
	$(MAKE) -C contrib/binance_btc_23
	$(MAKE) -C contrib/binance_btc_22
	$(MAKE) -C contrib/binance_btc_21
	$(MAKE) -C contrib/binance_btc_20
	$(MAKE) -C contrib/binance_btc_19
	$(MAKE) -C contrib/binance_btc_18
	$(MAKE) -C contrib/binance_btc_17
	$(MAKE) -C contrib/binance_btc_16
	$(MAKE) -C contrib/binance_btc_15
	$(MAKE) -C contrib/binance_btc_14
	$(MAKE) -C contrib/binance_btc_13
	$(MAKE) -C contrib/binance_btc_12
	$(MAKE) -C contrib/binance_btc_11
	$(MAKE) -C contrib/binance_btc_10
	$(MAKE) -C contrib/binance_btc_9
	$(MAKE) -C contrib/binance_btc_8
	$(MAKE) -C contrib/binance_btc_7
	$(MAKE) -C contrib/binance_btc_6
	$(MAKE) -C contrib/binance_btc_5
	$(MAKE) -C contrib/binance_btc_4
	$(MAKE) -C contrib/binance_btc_3
	$(MAKE) -C contrib/binance_btc_2
	$(MAKE) -C contrib/binance_bnb_50
	$(MAKE) -C contrib/binance_bnb_49
	$(MAKE) -C contrib/binance_bnb_48
	$(MAKE) -C contrib/binance_bnb_47
	$(MAKE) -C contrib/binance_bnb_46
	$(MAKE) -C contrib/binance_bnb_45
	$(MAKE) -C contrib/binance_bnb_44
	$(MAKE) -C contrib/binance_bnb_43
	$(MAKE) -C contrib/binance_bnb_42
	$(MAKE) -C contrib/binance_bnb_41
	$(MAKE) -C contrib/binance_bnb_40
	$(MAKE) -C contrib/binance_bnb_39
	$(MAKE) -C contrib/binance_bnb_38
	$(MAKE) -C contrib/binance_bnb_37
	$(MAKE) -C contrib/binance_bnb_36
	$(MAKE) -C contrib/binance_bnb_35
	$(MAKE) -C contrib/binance_bnb_34
	$(MAKE) -C contrib/binance_bnb_33
	$(MAKE) -C contrib/binance_bnb_32
	$(MAKE) -C contrib/binance_bnb_31
	$(MAKE) -C contrib/binance_bnb_30
	$(MAKE) -C contrib/binance_bnb_29
	$(MAKE) -C contrib/binance_bnb_28
	$(MAKE) -C contrib/binance_bnb_27
	$(MAKE) -C contrib/binance_bnb_26
	$(MAKE) -C contrib/binance_bnb_25
	$(MAKE) -C contrib/binance_bnb_24
	$(MAKE) -C contrib/binance_bnb_23
	$(MAKE) -C contrib/binance_bnb_22
	$(MAKE) -C contrib/binance_bnb_21
	$(MAKE) -C contrib/binance_bnb_20
	$(MAKE) -C contrib/binance_bnb_19
	$(MAKE) -C contrib/binance_bnb_18
	$(MAKE) -C contrib/binance_bnb_17
	$(MAKE) -C contrib/binance_bnb_16
	$(MAKE) -C contrib/binance_bnb_15
	$(MAKE) -C contrib/binance_bnb_14
	$(MAKE) -C contrib/binance_bnb_13
	$(MAKE) -C contrib/binance_bnb_12
	$(MAKE) -C contrib/binance_bnb_11
	$(MAKE) -C contrib/binance_bnb_10
	$(MAKE) -C contrib/binance_bnb_9
	$(MAKE) -C contrib/binance_bnb_8
	$(MAKE) -C contrib/binance_bnb_7
	$(MAKE) -C contrib/binance_bnb_6
	$(MAKE) -C contrib/binance_bnb_5
	$(MAKE) -C contrib/binance_bnb_4
	$(MAKE) -C contrib/binance_bnb_3
	$(MAKE) -C contrib/binance_bnb_2
	$(MAKE) -C contrib/ondiskagg
	$(MAKE) -C contrib/slait
	$(MAKE) -C contrib/stream
	$(MAKE) -C contrib/polygon
	$(MAKE) -C contrib/bitmexfeeder
	$(MAKE) -C contrib/testgdax_usd
	$(MAKE) -C contrib/testgdax_btc
	$(MAKE) -C contrib/gdax_usd
	$(MAKE) -C contrib/gdax_btc
	$(MAKE) -C contrib/binance_usdt_1
	$(MAKE) -C contrib/binance_btc_1
	$(MAKE) -C contrib/binance_eth_1
	$(MAKE) -C contrib/binance_bnb_1
	$(MAKE) -C contrib/binance_usdt_2
	$(MAKE) -C contrib/binance_btc_2
	$(MAKE) -C contrib/binance_eth_2
	$(MAKE) -C contrib/binance_bnb_2
	$(MAKE) -C contrib/binance_usdt_3
	$(MAKE) -C contrib/binance_btc_3
	$(MAKE) -C contrib/binance_eth_3
	$(MAKE) -C contrib/binance_bnb_3
	$(MAKE) -C contrib/binance_usdt_4
	$(MAKE) -C contrib/binance_btc_4
	$(MAKE) -C contrib/binance_eth_4
	$(MAKE) -C contrib/binance_bnb_4

unittest:
	go fmt ./...
	go test ./...

push:
	docker build --build-arg tag=$(DOCKER_TAG) -t alpacamarkets/marketstore:$(DOCKER_TAG) -t alpacamarkets/marketstore:latest .
	docker login -u $(DOCKER_USER) -p $(DOCKER_PASS)
	docker push alpacamarkets/marketstore:$(DOCKER_TAG)
	docker push alpacamarkets/marketstore:latest
