#!/bin/bash
# set -e

BIND_USER=named
BIND_DATA_DIR=${DATA_DIR}/named

create_bind_data_dir() {
  mkdir -p ${BIND_DATA_DIR}
  mkdir -p /var/cache/bind

  # populate default bind configuration if it does not exist
  if [ ! -d ${BIND_DATA_DIR}/etc ]; then
    mv /etc/named ${BIND_DATA_DIR}/etc
  fi
  rm -rf /etc/named
  ln -sf ${BIND_DATA_DIR}/etc /etc/named
  chmod -R 0775 ${BIND_DATA_DIR}
  chown -R ${BIND_USER}:${BIND_USER} ${BIND_DATA_DIR}
}

create_pid_dir() {
  mkdir -p /var/run/named
  chmod 0775 /var/run/named
  chown root:${BIND_USER} /var/run/named
}

create_bind_cache_dir() {
  mkdir -p /var/cache/bind
  chmod 0775 /var/cache/bind
#  chown root:${BIND_USER} /var/cache/bind
  chown named:named /var/cache/bind
}

create_alias_create_key() {
  rm -rf /bin/create-key
  ln -s /opt/create-key.sh /bin/create-key
}

create_blacklist_update() {
  echo "0 5 * * */7 /root/update_blacklist.sh >> /root/dns_update.log 2>&1" > /etc/cron.daily/dns-update
  chmod 0775 /etc/cron.daily/dns-update
  chmod 0755 /root/update_blacklist.sh
}

create_pid_dir
create_bind_data_dir
create_bind_cache_dir
create_alias_create_key
create_blacklist_update

# allow arguments to be passed to named
if [[ ${1:0:1} = '-' ]]; then
  EXTRA_ARGS="$*"
  set --
elif [[ ${1} == named || ${1} == "$(command -v named)" ]]; then
  EXTRA_ARGS="${*:2}"
  set --
fi

# default behaviour is to launch named
if [[ -z ${1} ]]; then
  echo "Starting named..."
  # exec $(which named) -u ${BIND_USER} -g ${EXTRA_ARGS}
  service named start
else
  /root/update_blacklist.sh
  exec "$@"
fi

