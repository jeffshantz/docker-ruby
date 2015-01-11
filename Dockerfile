FROM ubuntu:14.04

MAINTAINER jeff@csd.uwo.ca

RUN apt-get update -qq && \
    sudo apt-get install -y curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev libgdbm-dev software-properties-common && \
    apt-get clean && \
    cd /tmp && \
    curl -Ls http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz | tar -xz && \
    cd ruby-2.2.0 && \
    ./configure --enable-shared --disable-install-doc && \
    make && \
    make install && \
    gem install bundler && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
