FROM ruby:3.3

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

RUN apt-get update && apt-get install -y \
    libhunspell-dev \
    hunspell-en-us && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/

RUN gem install bundler:2.1.4 && bundle update --bundler
RUN bundle install

RUN sha256sum Gemfile Gemfile.lock > /build.sha256

ADD docker/build/run.sh /run.sh

VOLUME /src

WORKDIR /src
ENTRYPOINT ["/run.sh"]
