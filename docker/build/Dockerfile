FROM ruby:2.7.6

WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
ADD docker/build/run.sh /run.sh

RUN gem install bundler:2.1.4 && bundle update --bundler
RUN bundle install

VOLUME /src

WORKDIR /src
ENTRYPOINT ["/run.sh"]
