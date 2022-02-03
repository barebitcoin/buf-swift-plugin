# buf-swift-plugin

[Buf](https://buf.build/) plugins for Swift code generation

# Usage

```yaml
# buf.gen.yaml

version: v1

plugins:
  - remote: buf.build/ngu-tek/plugins/swift:v1.6.1-1
    out: gen
    # https://github.com/grpc/grpc-swift/blob/main/docs/plugin.md#plugin-options
    opt:
      - Visibility=Public

  - remote: buf.build/ngu-tek/plugins/swift-grpc:v1.6.1-1
    out: gen
    # https://github.com/grpc/grpc-swift/blob/main/docs/plugin.md#plugin-options
    opt:
      - Client=true
      - Server=false
      - Visibility=Public
```
