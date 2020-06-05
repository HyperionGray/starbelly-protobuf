.PHONY: all build install

all: build install

build:
	@echo Building protobuf and docs
	protoc --plugin=protobuf/protoc_plugin/bin/protoc-gen-dart \
		   --dart_out=build \
		   --python_out=build \
		   starbelly.proto
	docker run --rm -v "$(PWD)/build:/out" -v "$(PWD):/protos" \
		pseudomuto/protoc-gen-doc --doc_opt=/protos/template.html,protobuf.html

install:
	@echo "Copying protobuf and docs to starbelly server and client directories"
	cp build/*.dart ../starbelly-web-client/lib/protobuf/
	cp build/starbelly_pb2.py ../starbelly/starbelly/
	cp build/protobuf.html ../starbelly/docs/
