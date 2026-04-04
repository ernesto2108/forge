BINARY_NAME := forge
BUILD_DIR := .
GO_CMD := go

.PHONY: build install clean test vet

build:
	$(GO_CMD) build -o $(BUILD_DIR)/$(BINARY_NAME) ./cmd/forge/

install:
	$(GO_CMD) install ./cmd/forge/

clean:
	rm -f $(BUILD_DIR)/forge $(BUILD_DIR)/anvil

test:
	$(GO_CMD) test -race ./...

vet:
	$(GO_CMD) vet ./...

# Build both binaries (forge + anvil symlink)
all: build
	ln -sf forge $(BUILD_DIR)/anvil
