FROM abiosoft/caddy:no-stats

WORKDIR /var/www

COPY . /var/www

COPY ./caddy/caddy /etc/caddy

COPY ./caddy/log /var/log/caddy

COPY ./caddy/data /root/.caddy

CMD ["--conf", "/etc/caddy/Caddyfile", "--log", "stdout", "--agree=true"]

EXPOSE 80 443 2015
