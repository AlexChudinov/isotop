if [[ ! -d grpc ]]; then
git clone --recurse-submodules -b v1.70.1 --depth 1 --shallow-submodules https://github.com/grpc/grpc
fi

docker build -f infrastructure/Dockerfile.base -t isotop-base:1 .
