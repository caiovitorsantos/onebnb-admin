FROM ruby:2.3-slim

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev imagemagick git

ENV INSTALL_PATH /onebnb_api

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock ./

RUN bundle install --system

COPY . .

CMD puma -C config/puma.rb