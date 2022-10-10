FROM ruby:3.0.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN mkdir /ruby_challenge

WORKDIR /ruby_challenge

RUN bundle config build.nokogiri --use-system-libraries

ENTRYPOINT ["/ruby_challenge/docker-entrypoint.sh"]