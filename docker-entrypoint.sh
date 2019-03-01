#!/usr/bin/env bash

set -xeuo pipefail

bundle install
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails s -b 0.0.0.0
