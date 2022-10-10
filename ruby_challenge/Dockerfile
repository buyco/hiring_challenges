FROM ruby:3.0.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN mkdir /ruby_challenge

WORKDIR /ruby_challenge

COPY Gemfile /ruby_challenge/Gemfile

COPY Gemfile.lock /ruby_challenge/Gemfile.lock

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

COPY . /ruby_challenge

ENTRYPOINT ["/ruby_challenge/docker-entrypoint.sh"]