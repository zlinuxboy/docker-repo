FROM alpine as builder

RUN apk add alpine-sdk linux-headers cargo openssl openssl-dev

WORKDIR /
RUN git clone https://github.com/zerotier/ZeroTierOne.git --depth=1

WORKDIR /ZeroTierOne
RUN make 

FROM alpine

LABEL author="zouyiq@gmail.com"

COPY --from=builder /ZeroTierOne/zerotier-one /usr/sbin
COPY --from=builder /ZeroTierOne/zerotier-cli /usr/sbin
COPY --from=builder /ZeroTierOne/zerotier-idtool /usr/sbin

RUN apk add --no-cache libstdc++ && rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
COPY moon.sh /moon.sh
RUN chmod 755 /entrypoint.sh
RUN chmod 755 /moon.sh

ENTRYPOINT ["/entrypoint.sh"]
