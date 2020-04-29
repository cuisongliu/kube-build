FROM golang:1.13.4

RUN apt-get update \
  && apt-get install -y rsync jq apt-utils file patch unzip \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN PROTOBUF_VERSION=3.0.2; ZIPNAME="protoc-${PROTOBUF_VERSION}-linux-x86_64.zip"; \
  mkdir /tmp/protoc && cd /tmp/protoc \
  && wget "https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOBUF_VERSION}/${ZIPNAME}" \
  && unzip "${ZIPNAME}" \
  && chmod -R +rX /tmp/protoc \
  && cp -pr bin /usr/local \
  && cp -pr include /usr/local \
  && rm -rf /tmp/protoc \
  && protoc --version

RUN go get golang.org/x/tools/cmd/cover \
           golang.org/x/tools/cmd/goimports \
    && go clean -cache
