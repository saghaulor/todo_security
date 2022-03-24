FROM ruby:2.5-slim AS builder
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libmariadb-dev
RUN mkdir /todo_fail
WORKDIR /todo_fail
COPY Gemfile* /todo_fail/
RUN bundle config set without 'development test'
RUN RAILS_ENV=production bundle install

FROM ruby:2.5-slim AS todo_security
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libmariadb-dev
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
RUN mkdir /todo_fail
WORKDIR /todo_fail
COPY . /todo_fail