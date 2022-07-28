GRPC_SWIFT_VERSION := 1.7.2
PLUGIN_VERSION := 1

BASE_NAME := plugins.buf.build/ngu-tek
SWIFT_IMAGE := "${BASE_NAME}/swift:v${GRPC_SWIFT_VERSION}-${PLUGIN_VERSION}" 
SWIFT_GRPC_IMAGE := "${BASE_NAME}/swift-grpc:v${GRPC_SWIFT_VERSION}-${PLUGIN_VERSION}" 

gen-swift-image: 
	docker build \
		--tag ${SWIFT_IMAGE} \
		--target gen-swift .

gen-swift-grpc-image: 
	docker build \
		--tag ${SWIFT_GRPC_IMAGE} \
		--target gen-grpc .

images: gen-swift-grpc-image gen-swift-image
