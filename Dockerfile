FROM cbwang/kcp-ssr-docker

RUN apk add libnet-dev libpcap-dev
RUN git clone https://github.com/snooda/net-speeder.git net-speeder
WORKDIR net-speeder
RUN sh build.sh

RUN mv net_speeder /usr/local/bin/

ADD start.sh /netspeederstart.sh

ENTRYPOINT ["/netspeederstart.sh"]
