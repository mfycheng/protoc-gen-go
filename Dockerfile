FROM golang:1.17

# Base libraries
RUN apt-get update
RUN apt-get install -y protobuf-compiler

# Go proto dependencies
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.27.1
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1
RUN go install github.com/envoyproxy/protoc-gen-validate@v0.6.3

# Common base proto dependencies.
RUN git clone https://github.com/googleapis/googleapis

RUN mkdir -p /proto-common/validate
RUN cp pkg/mod/github.com/envoyproxy/protoc-gen-validate@v0.6.3/validate/validate.proto /proto-common/validate/validate.proto
RUN cp -r googleapis/google /proto-common

COPY generate.sh generate.sh
RUN chmod +x generate.sh

ENTRYPOINT [ "./generate.sh" ]
