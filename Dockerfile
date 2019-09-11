FROM mileschou/phalcon:7.1-apache

MAINTAINER Thanh Huynh <huynhbathanh@gmail.com>

RUN /usr/sbin/a2enmod rewrite
ADD 000-phalcon.conf /etc/apache2/sites-available/
ADD 001-phalcon-ssl.conf /etc/apache2/sites-available/
RUN /usr/sbin/a2dissite '*' && /usr/sbin/a2ensite 000-phalcon 001-phalcon-ssl

RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libjpeg-dev\
    libpng-dev\
    libfreetype6-dev \
    libpq-dev \
    libicu-dev g++

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install pdo pdo_mysql mysqli zip gd intl


# Fix "AH00558: apache2: Could not reliably determine the server's fully qualified domain name"
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Cleanup some things.
RUN apt-get -q autoclean && \
  rm -rf /var/lib/apt/lists/*


EXPOSE 80 443