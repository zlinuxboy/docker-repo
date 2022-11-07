FROM alpine:edge AS devtools

RUN apk add boost-dev boost-static build-base cmake curl git gcc g++ libc-dev ninja perl unzip tar zip

RUN git clone https://github.com/Microsoft/vcpkg.git
WORKDIR vcpkg

RUN VCPKG_FORCE_SYSTEM_BINARIES=1 ./bootstrap-vcpkg.sh -disableMetrics
RUN VCPKG_FORCE_SYSTEM_BINARIES=1 ./vcpkg install --triplet x64-linux toml11