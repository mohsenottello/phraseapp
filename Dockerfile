FROM ruby:2.6.2
RUN apt-get update -qq && apt-get install -y postgresql-client
WORKDIR /phraseapp
COPY Gemfile Gemfile.lock ./

RUN gem install bundler
RUN bundle install

COPY . .

EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]
CMD [ "rails", "server", "-b", "0.0.0.0" ]
