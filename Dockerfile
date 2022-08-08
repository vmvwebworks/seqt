# syntax=docker/dockerfile:1
FROM ruby:3.0
WORKDIR /seQura_test
COPY Gemfile /seQura_test/Gemfile
COPY Gemfile.lock /seQura_test/Gemfile.lock
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client cron

ENV RAILS_ENV development

RUN bundle install



# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
