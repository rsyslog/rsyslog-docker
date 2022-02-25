FROM    alpine:3.15
LABEL   maintainer="rgerhards@adiscon.com"
COPY    rsyslog@lists.adiscon.com-5a55e598.rsa.pub /etc/apk/keys/rsyslog@lists.adiscon.com-5a55e598.rsa.pub

USER root
RUN sed -i 's/https/http/' /etc/apk/repositories

#RUN     echo "http://alpine.rsyslog.com/3.15/stable" >> /etc/apk/repositories \
RUN     apk --no-cache update  \
        && apk add --no-cache \
           rsyslog \
           rsyslog-mmjsonparse \
           rsyslog-pgsql \
           rsyslog-hiredis \
           rsyslog-snmp \
           rsyslog-mmnormalize \
           rsyslog-dbg \
           rsyslog-clickhouse \
           rsyslog-mmsequence \
           rsyslog-gssapi \
           rsyslog-pmlastmsg \
           rsyslog-mmfields \
           rsyslog-tls \
           rsyslog-mmpstrucdata \
           rsyslog-elasticsearch \
           rsyslog-mmsnmptrapd \
           rsyslog-udpspoof \
           rsyslog-uxsock \
           rsyslog-http \
           rsyslog-imdocker \
           rsyslog-relp \
           rsyslog-mmaudit \
           rsyslog-mysql \
           rsyslog-mmrm1stspace \
           rsyslog-mmutf8fix \
           rsyslog-crypto \
           rsyslog-libdbi \
           rsyslog-pmsnare \
           rsyslog-openrc \
           rsyslog-mmcount \
           rsyslog-zmq \
           rsyslog-mmanon \
           rsyslog-rabbitmq \
           rsyslog-mmdblookup \
           rsyslog-pmaixforwardedfrom \
           libc-utils
RUN     adduser -s /bin/ash -D rsyslog rsyslog \
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
RUN     echo "`date +%F` (`date +%s`)" > CONTAINER.release \
        && chown -R rsyslog:rsyslog * && \
        chmod +x starter.sh

USER rsyslog
CMD     ["rsyslog"]
ENTRYPOINT ["/home/appliance/starter.sh"]

