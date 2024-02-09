FROM debian:bullseye-slim as base

RUN apt-get update -yq && \
    apt-get upgrade -yq && \
    apt-get -yq --no-install-recommends install curl wget tcpdump iputils-ping dnsutils vim net-tools telnet libevent-2.1-7 libevent-dev libwww-perl libjson-xs-perl libsctp1 && \
    rm -rf /var/lib/apt/lists/*


FROM base as builder

RUN apt-get update -yq && \
    apt-get upgrade -yq && \
    apt-get -yq --no-install-recommends install build-essential libevent-2.1-7 libevent-dev fakeroot debhelper lsb-release libssl-dev libcap-dev libz-dev libsctp-dev && \
    rm -rf /var/lib/apt/lists/*

RUN cd /usr/src && \
    wget --inet4-only http://he.fi/aprsc/down/aprsc-latest.tar.gz && \
    tar xvfz aprsc-latest.tar.gz && \
    cd aprsc* && \ 
    cd src && \
    ./configure && \
    make make-deb && \
    cp ../*.deb /tmp
    
FROM base

COPY --from=builder /tmp/*deb /tmp
RUN dpkg -i /tmp/*.deb


#CMD ["tail", "-f", "/dev/null"]

CMD ["/opt/aprsc/sbin/aprsc", "-u", "aprsc", "-t", "/opt/aprsc/", "-e", "info", "-o", "stderr", "-c", "/etc/aprsc.conf"]

