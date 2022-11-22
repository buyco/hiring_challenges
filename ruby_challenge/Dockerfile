FROM ruby:3.0.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN bundle config build.nokogiri --use-system-libraries

RUN useradd ruby_challenger -m -u 1000

USER ruby_challenger