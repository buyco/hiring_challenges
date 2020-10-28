FROM ruby:2.7.1
RUN apt-get update -qq 

RUN apt-get install -y build-essential

RUN mkdir /metal_counter_service

WORKDIR /metal_counter_service

COPY Gemfile /metal_counter_service/Gemfile

COPY Gemfile.lock /metal_counter_service/Gemfile.lock

COPY worker.rb /metal_counter_service/worker.rb

RUN bundle install --retry=3

RUN gem install sneakers

COPY . /metal_counter_service

EXPOSE 80

CMD ["bundle", "exec", "foreman", "start"]