FROM ruby:2.5.3

ENV LANG C.UTF-8 \
    BUNDLE_BIN /usr/local/bundle/bin \
    DOCKER 1

WORKDIR /app
COPY . .
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install -j3 --path vendor/bundle

ENTRYPOINT ["./docker-entrypoint.sh"]
