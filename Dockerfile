FROM swift:5.5.2 AS base

RUN apt-get -q update && \
    apt-get install -y git make

ARG GRPC_SWIFT_VERSION=1.7.2

# Build and install the swiftgrpc plugin
WORKDIR /tmp/grpc-build
RUN git clone https://github.com/grpc/grpc-swift && \
    cd grpc-swift && \
    git checkout ${GRPC_SWIFT_VERSION} && \
    make plugins && \
    cp protoc-gen-swift /usr/bin && \
    cp protoc-gen-grpc-swift /usr/bin

RUN rm -r /tmp/grpc-build

FROM swift:5.5.2-slim AS gen-swift

COPY --from=base /usr/bin/protoc-gen-swift /usr/bin/protoc-gen-swift

ENTRYPOINT [ "protoc-gen-swift" ]

FROM swift:5.5.2-slim AS gen-grpc

COPY --from=base /usr/bin/protoc-gen-grpc-swift /usr/bin/protoc-gen-grpc-swift

ENTRYPOINT [ "protoc-gen-grpc-swift" ]