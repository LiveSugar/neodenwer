FROM archlinux/base

RUN pacman --noconfirm -Syu && \
mkdir -p /var/cache/pacman/pkg && \
pacman --noconfirm -Syu git wget yajl redis postgresql nginx htop freetype2 harfbuzz neovim composer php-fpm php php-gd php-imap php-intl php-pgsql php-snmp php-sqlite php-xsl php-geoip && \
/bin/mkdir -p /webserver && \
chown -R http:http /webserver && \
mkdir -p /run/postgresql && \
mkdir -p /var/lib/postgres/data && \
mkdir -p /var/log/postgres && \
chown -R postgres:postgres /run/postgresql && \
chown -R postgres:postgres /var/lib/postgres && \
chown -R postgres:postgres /var/log/postgres && \
su - postgres -c "initdb --locale en_US.UTF-8 -E UTF8 -D '/var/lib/postgres/data' --auth-local=trust --auth-host=trust" && \
chown -R postgres:postgres /run/postgresql && \
chown -R postgres:postgres /var/lib/postgres && \
chown -R postgres:postgres /var/log/postgres && \
mkdir -p /opt/arangodb && \
groupadd arangodb && useradd -g arangodb arangodb && \
chown -R arangodb:arangodb /opt/arangodb && \
echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
groupadd dev && useradd -b /home/dev -d /home/dev -m -g dev -G dev dev && echo "dev:1234567890" | chpasswd && echo "root:1234567890" | chpasswd

COPY src/arangodb /opt/arangodb
COPY src/redis/redis.conf /etc
COPY src/nginx/nginx.conf /etc/nginx
COPY src/php/php.ini /etc/php
COPY src/php/www.conf /etc/php/php-fpm.d
COPY src/start /usr/sbin

# Start
CMD /usr/sbin/start
