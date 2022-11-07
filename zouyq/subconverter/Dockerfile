FROM alpine as builder

RUN apk add --no-cache git g++ build-base linux-headers cmake curl-dev rapidjson-dev libevent-dev pcre2-dev yaml-cpp-dev

WORKDIR /home
RUN git clone https://github.com/ftk/quickjspp --depth=1
WORKDIR quickjspp
RUN git submodule update --init
RUN cmake -DCMAKE_BUILD_TYPE=Release . && \
    make quickjs  && \
    install -m644 quickjs/libquickjs.a /usr/lib && \
    install -d /usr/include/quickjs/ && \
    install -m644 quickjs/quickjs.h quickjs/quickjs-libc.h /usr/include/quickjs/ && \
    install -m644 quickjspp.hpp /usr/include

WORKDIR /home
RUN git clone https://github.com/PerMalmberg/libcron --depth=1
WORKDIR libcron
RUN git submodule update --init
RUN  cmake -DCMAKE_BUILD_TYPE=Release . && \
    make libcron && \
    install -m644 libcron/out/Release/liblibcron.a /usr/lib/ && \
    install -d /usr/include/libcron/ && \
    install -m644 libcron/include/libcron/* /usr/include/libcron/ && \
    install -d /usr/include/date/ && \
    install -m644 libcron/externals/date/include/date/* /usr/include/date/

WORKDIR /home
RUN git clone https://github.com/ToruNiina/toml11 --depth=1
WORKDIR toml11
RUN cmake -DCMAKE_CXX_STANDARD=11 . && make install

WORKDIR /home
RUN git clone https://github.com/tindy2013/subconverter --depth=1
WORKDIR subconverter
RUN cmake -DCMAKE_BUILD_TYPE=Release . && make -j8

FROM alpine
LABEL MAINTAINER="zyqcn@live.com"

RUN apk add --no-cache pcre2 libcurl yaml-cpp libevent tzdata

COPY --from=builder /home/subconverter/base /base
COPY --from=builder /home/subconverter/subconverter /usr/local/bin

WORKDIR /base
ENTRYPOINT ["subconverter"]