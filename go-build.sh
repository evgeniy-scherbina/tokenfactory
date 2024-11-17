env GOOS=linux GOARCH=amd64 go build -o ./build/tokenfactory-linux-amd64 ./cmd/tokenfactoryd/main.go
env GOOS=linux GOARCH=arm64 go build -o ./build/tokenfactory-linux-arm64 ./cmd/tokenfactoryd/main.go
env GOOS=darwin GOARCH=amd64 go build -o ./build/tokenfactory-darwin-amd64 ./cmd/tokenfactoryd/main.go
env GOOS=darwin GOARCH=arm64 go build -o ./build/tokenfactory-darwin-arm64 ./cmd/tokenfactoryd/main.go
