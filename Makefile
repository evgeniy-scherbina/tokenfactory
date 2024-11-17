build-all:
	env GOOS=linux GOARCH=amd64 go build -o ./build/tokenfactory-linux-amd64 ./cmd/tokenfactoryd/main.go
	env GOOS=linux GOARCH=arm64 go build -o ./build/tokenfactory-linux-arm64 ./cmd/tokenfactoryd/main.go
	env GOOS=darwin GOARCH=amd64 go build -o ./build/tokenfactory-darwin-amd64 ./cmd/tokenfactoryd/main.go
	env GOOS=darwin GOARCH=arm64 go build -o ./build/tokenfactory-darwin-arm64 ./cmd/tokenfactoryd/main.go

install:
	go install ./cmd/...

do-checksum:
	shasum ./build/tokenfactory-linux-amd64 ./build/tokenfactory-linux-arm64 ./build/tokenfactory-darwin-amd64 ./build/tokenfactory-darwin-arm64 > ./build/release_checksum

build-with-checksum: build-all do-checksum

verify-checksum:
	shasum --check ./build/release_checksum

# Build docker image and tag as tokenfactory/tokenfactory:local
docker-build:
	DOCKER_BUILDKIT=1 docker build -t tokenfactory/tokenfactory:local .
