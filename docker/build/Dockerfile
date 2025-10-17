FROM ruby:3.4.1

# Set locale
#RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
#    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
#    && locale-gen \
#    && update-locale LANG=en_US.UTF-8
#ENV LANG en_US.UTF-8  
#ENV LANGUAGE en_US:en  
#ENV LC_ALL en_US.UTF-8

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libhunspell-dev \
    hunspell-en-us && \
    rm -rf /var/lib/apt/lists/*

# Set up GEM paths to avoid permission issues
ENV GEM_HOME=/usr/local/bundle
ENV PATH=$GEM_HOME/bin:$PATH

# Set working directory
WORKDIR /tmp

# Copy Gemfile
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/

# Upgrade Bundler and ensure compatibility
RUN gem install bundler:2.4.22 --no-document && bundle update --bundler

# Install dependencies inside /usr/local/bundle
RUN bundle install --path /usr/local/bundle

# Store build hash
RUN sha256sum Gemfile Gemfile.lock > /build.sha256

# Add script for execution
ADD docker/build/run.sh /run.sh

# Mount source files
VOLUME /src

# Set working directory and the entrypoint
WORKDIR /src
ENTRYPOINT ["/run.sh"]
