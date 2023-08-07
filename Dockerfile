FROM ruby:3.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client
WORKDIR /TeamFlow
ADD Gemfile /TeamFlow/Gemfile
ADD Gemfile.lock /TeamFlow/Gemfile.lock
RUN bundle install
ADD . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
