FROM ruby:2.7.1

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /boxes_creator_service

WORKDIR /boxes_creator_service

COPY Gemfile /boxes_creator_service/Gemfile

COPY Gemfile.lock /boxes_creator_service/Gemfile.lock

COPY db/initializer.rb /boxes_creator_service/db/initializer.rb

RUN bundle install

COPY . /boxes_creator_service

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "3000"]