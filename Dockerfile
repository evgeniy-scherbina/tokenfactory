FROM golang:1.22-alpine AS build-env

# Set up dependencies
# bash, jq, curl for debugging
# git, make for installation
# libc-dev, gcc, linux-headers, eudev-dev are used for cgo and ledger installation
RUN apk add bash git make libc-dev gcc linux-headers eudev-dev jq curl

# Set working directory for the build
WORKDIR /root/tokenfactory
# default home directory is /root

# Copy dependency files first to facilitate dependency caching
COPY ./go.mod ./
COPY ./go.sum ./

# Download dependencies
RUN --mount=type=cache,target=/root/.cache/go-build \
    --mount=type=cache,target=/go/pkg/mod \
    go version && go mod download

# Add source files
COPY . .

RUN mkdir -p /root/.tokenfactory/config
RUN mkdir -p /root/.tokenfactory/data

RUN cp -r /root/tokenfactory/config/* /root/.tokenfactory/config/
RUN cp -r /root/tokenfactory/data/* /root/.tokenfactory/data/

# Mount go build and mod caches as container caches, persisted between builder invocations
RUN --mount=type=cache,target=/root/.cache/go-build \
    --mount=type=cache,target=/go/pkg/mod \
    make install

CMD ["tokenfactoryd"]
