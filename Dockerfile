FROM golang:1.17

# Base libraries
RUN apt-get update
RUN apt-get install -y protobuf-compiler

# Go proto dependencies
# RUN go install google.golang.org/grpc@latest
RUN go install github.com/golang/protobuf/protoc-gen-go@latest

# Common base proto dependencies.
RUN git clone https://github.com/envoyproxy/protoc-gen-validate
RUN git clone https://github.com/googleapis/googleapis

RUN mkdir /proto-common
RUN cp -r protoc-gen-validate/validate /proto-common/validate
RUN cp -r googleapis/google /proto-common

COPY generate.sh generate.sh
RUN chmod +x generate.sh

ENTRYPOINT [ "./generate.sh" ]
