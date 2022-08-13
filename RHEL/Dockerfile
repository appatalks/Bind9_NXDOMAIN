FROM # TBD <FIND RHEL/CENTOS/ALMA?>

ENV BIND_USER=named \
    DATA_DIR=/data

RUN yum update \
 && RHEL_FRONTEND=noninteractive yum install -y \
      bind bind-utils curl wget

COPY entrypoint.sh /sbin/entrypoint.sh

COPY named.conf /etc/named/named.conf

COPY blockeddomain.hosts /var/cache/bind/blockeddomain.hosts

COPY blacklist.db /var/cache/bind/blacklist.db

COPY update_blacklist.sh /root/update_blacklist.sh

RUN chmod 755 /root/update_blacklist.sh
RUN chmod 755 /sbin/entrypoint.sh #/opt/create-key.sh

EXPOSE 53/udp 53/tcp

ENTRYPOINT ["/sbin/entrypoint.sh"]

CMD ["/usr/sbin/named"]

