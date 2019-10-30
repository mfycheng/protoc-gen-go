# protoc-gen-go

Provides a proto build environment that contains:

* [Google APIs](https://github.com/googleapis/googleapis):
    * Primarily for the Annotations, required by grpc-gateway
* [Envoyproxy Validation](https://github.com/envoyproxy/protoc-gen-validate)
    * Validation framework.

# Usage

The image runs `protoc` with both the Google API and Validation protos as import paths,
using the grpc and envoy validation proxy, for each proto found in the `/proto` directory.
The generated output is located in `/genproto`.

An example usage is:

```
docker run -v api:/proto -v genproto:/genproto mfycheng/protoc-gen-go
```

Which compiles all of the protos (recursively) in `api` and puts it in`genproto`

