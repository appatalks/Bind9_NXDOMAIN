FROM # Arch Linux

ENV BIND_USER=bind \
    DATA_DIR=/data

RUN pacman -Sy \
 && ARCH_FRONTEND=noninteractive apt-get install -y \
      bind9 bind9utils dnsutils wget\
 && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/entrypoint.sh

COPY named.conf /etc/bind/named.conf

COPY blockeddomain.hosts /var/cache/bind/blockeddomain.hosts

COPY blacklist.db /var/cache/bind/blacklist.db

COPY update_blacklist.sh /root/update_blacklist.sh

RUN chmod 755 /root/update_blacklist.sh
RUN chmod 755 /sbin/entrypoint.sh #/opt/create-key.sh

EXPOSE 53/udp 53/tcp

ENTRYPOINT ["/sbin/entrypoint.sh"]

CMD ["/usr/sbin/named"]

