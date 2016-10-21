FROM cbwang/kcp-ssr-docker

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    echo "http://dl-3.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    echo "http://dl-5.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add libnet-dev libpcap-dev git
RUN git clone https://github.com/snooda/net-speeder.git net-speeder
WORKDIR net-speeder
RUN sh build.sh

RUN mv net_speeder /usr/local/bin/

ADD start.sh /netspeederstart.sh
RUN chmod +x /netspeederstart.sh
RUN chmod +x /usr/local/bin/net_speeder

ENTRYPOINT ["/netspeederstart.sh"]
