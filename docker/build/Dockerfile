FROM ruby:3.4.1

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

# Upgrade Bundler
RUN gem install bundler:4.0.21 --no-document

# Install dependencies inside /usr/local/bundle
RUN bundle config set path '/usr/local/bundle' && bundle install

# Store build hash
RUN sha256sum Gemfile Gemfile.lock > /build.sha256

# Add script for execution
ADD docker/build/run.sh /run.sh

# Mount source files
VOLUME /src

# Set working directory and the entrypoint
WORKDIR /src
ENTRYPOINT ["/run.sh"]
