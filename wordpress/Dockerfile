FROM wordpress:php7.2-fpm-alpine

WORKDIR /app
RUN apk update
RUN apk add curl
RUN apk add tar
RUN curl https://wordpress.org/latest.tar.gz > wordpress.tar.gz
RUN tar -xf wordpress.tar.gz
WORKDIR /app/wordpress
RUN cp wp-config-sample.php wp-config.php
COPY cmd.sh /usr/local/bin/
CMD ["cmd.sh"]
