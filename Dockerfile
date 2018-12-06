FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /todo_fail
WORKDIR /todo_fail
COPY Gemfile* /todo_fail/
ENV RAILS_ENV=production
RUN bundle install
COPY . /todo_fail
