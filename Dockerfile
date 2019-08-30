FROM ubuntu:18.04

### SYSTEM DEPENDENCIES

ENV DEBIAN_FRONTEND="noninteractive" \
    LC_ALL="en_US.UTF-8" \
    LANG="en_US.UTF-8"

# Everything from `make` onwards in apt-get install is only installed to ensure
# Python support works with all packages (which may require specific libraries
# at install time).

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
      gnupg2 \
      curl \
      unzip \
      locales \
      git \
    && locale-gen en_US.UTF-8

### PHP

# Install PHP 7.3 and Composer
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu bionic main" >> /etc/apt/sources.list.d/ondrej-php.list \
    && echo "deb-src http://ppa.launchpad.net/ondrej/php/ubuntu bionic main" >> /etc/apt/sources.list.d/ondrej-php.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C \
    && apt-get update \
    && apt-get install -y php7.3 php7.3-xml php7.3-json php7.3-zip php7.3-mbstring php7.3-intl php7.3-common php7.3-gettext php7.3-curl php7.3-apcu \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer
