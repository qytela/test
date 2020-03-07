FROM nginx:alpine

WORKDIR /var/www

COPY . /var/www

ADD ./nginx/vhost.conf /etc/nginx/conf.d/default.conf

EXPOSE 80