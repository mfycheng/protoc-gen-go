#!/bin/bash -e

for f in $(find /proto/ -type f -name "*.proto"); do
    protoc -I/proto-common:/proto $f \
            --go_out=/genproto --go_opt=module=$MODULE_PREFIX \
            --go-grpc_out=/genproto --go-grpc_opt=module=$MODULE_PREFIX \
            --validate_opt=module=$MODULE_PREFIX --validate_out=lang=go:../genproto
done
