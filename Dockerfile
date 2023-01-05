FROM debian:bullseye-slim

RUN apt-get update -yq && \
    apt-get upgrade -yq && \
    apt-get -yq --no-install-recommends install dirmngr gpg gpg-agent && \
    gpg --keyserver keyserver.ubuntu.com --recv C51AA22389B5B74C3896EF3CA72A581E657A2B8D && \
    gpg --export C51AA22389B5B74C3896EF3CA72A581E657A2B8D | apt-key add - && \
    echo "deb http://aprsc-dist.he.fi/aprsc/apt bullseye main" > /etc/apt/sources.list.d/aprsc.list && \
    apt-get update -yq && \
    apt-get upgrade -yq && \
    apt-get -yq --no-install-recommends install curl wget tcpdump iputils-ping dnsutils vim net-tools telnet aprsc && \
    rm -rf /var/lib/apt/lists/*

CMD ["/opt/aprsc/sbin/aprsc", "-u", "aprsc", "-t", "/opt/aprsc/", "-e", "info", "-o", "stderr", "-c", "/etc/aprsc.conf"]

