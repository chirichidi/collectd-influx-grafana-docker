FROM debian:jessie

RUN echo "APT::Install-Recommends false;" >> /etc/apt/apt.conf.d/recommends.conf && \
    echo "APT::AutoRemove::RecommendsImportant false;" >> /etc/apt/apt.conf.d/recommends.conf && \
    echo "APT::AutoRemove::SuggestsImportant false;" >> /etc/apt/apt.conf.d/recommends.conf && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y collectd python-pip ca-certificates && \
    pip install envtpl && \
    apt-get install -y curl && \
    curl -sL https://github.com/tianon/gosu/releases/download/1.4/gosu-amd64 > /usr/bin/gosu && \
    chmod +x /usr/bin/gosu && \
    apt-get remove -y curl && \
    apt-get autoremove -y

COPY collectd.conf /etc/collectd/collectd.conf
COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]