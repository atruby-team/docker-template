FROM ruby:2.5.3

ENV LANG C.UTF-8 \
    BUNDLE_BIN /usr/local/bundle/bin \
    DOCKER 1

RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list \
  && apt-get update \
  && apt-get install -y --no-install-recommends qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x xvfb imagemagick \
  && rm -rf /var/lib/apt/lists/* \
  && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs

WORKDIR /app
COPY . .
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install -j3 --path vendor/bundle

ENTRYPOINT ["./docker-entrypoint.sh"]
