FROM	ubuntu:20.04
LABEL   maintainer="rgerhards@adiscon.com"


ENV	DEBIAN_FRONTEND=noninteractive
RUN	apt-get -y update \
        && apt-get -y install --no-install-recommends --yes python3 apt-utils software-properties-common curl \
	&& apt-get -y upgrade \
	&& add-apt-repository -y ppa:adiscon/v8-stable \
	&& apt-get -y update \
	&& apt-get -y install libfastjson4 \
           rsyslog \
           rsyslog-mmjsonparse \
           rsyslog-pgsql \
           rsyslog-mmnormalize \
           rsyslog-mmfields \
           rsyslog-elasticsearch \
           rsyslog-imdocker \
           rsyslog-relp \
           rsyslog-mysql \
           rsyslog-mmrm1stspace \
           rsyslog-mmutf8fix \
           rsyslog-omstdout \
           rsyslog-mmanon
RUN     groupadd rsyslog \
	&& useradd -g rsyslog  -s /bin/bash rsyslog \
	&& echo "rsyslog ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
VOLUME  /config /work /logs
COPY    rsyslog.conf /etc/rsyslog.conf
COPY    rsyslog.conf.d/*.conf /etc/rsyslog.conf.d/
# done base system setup

WORKDIR /home/appliance
COPY    starter.sh CONTAINER.* ./
COPY    internal/* ./internal/
COPY    internal/container_config /config/
COPY    internal/droprules.conf /config/
COPY    tools/* ./tools/
COPY    custom-builds/* /usr/lib/rsyslog/
COPY    custom-builds-liblog/* /usr/lib/
RUN     echo "`date +%F` (`date +%s`)" > CONTAINER.release \
        && chown -R rsyslog:rsyslog * && \
        chmod +x starter.sh && \
        chmod +x /usr/sbin/rsyslogd

USER rsyslog
CMD     ["rsyslog"]
ENTRYPOINT ["/home/appliance/starter.sh"]

