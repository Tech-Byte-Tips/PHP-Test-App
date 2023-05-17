# Base Image is latest Alpine
FROM alpine:latest

# Maintainer information and description
LABEL maintainer="Jorge Pabón <pianistapr@hotmail.com>" description="Alpine + Apache2 + PHP8 + PDO Extensions"

# Setup Apache and PHP 8, also create the directory that will hold our application files /app
RUN apk --no-cache --update \
    add apache2 \
    apache2-ssl \
    curl \
    php81-apache2 \
    php81-bcmath \
    php81-bz2 \
    php81-calendar \
    php81-common \
    php81-ctype \
    php81-curl \
    php81-dom \
    php81-gd \
    php81-iconv \
    php81-mbstring \
    php81-mysqli \
    php81-mysqlnd \
    php81-openssl \
    php81-pdo \
    php81-pdo_dblib \
    php81-pdo_mysql \
    php81-pdo_odbc \
    php81-pdo_pgsql \
    php81-pdo_sqlite \
    php81-phar \
    php81-session \
    php81-xml \
    && mkdir /app

# Copy our application to the /app directory
COPY ./App /app

# Expose our web ports
EXPOSE 80 443

# Add the entrypoint script
ADD entrypoint.sh /

# Execute the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]