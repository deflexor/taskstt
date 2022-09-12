FROM ruby:3.1.2
RUN apt-get update -qq
RUN apt-get install -y libpq-dev
RUN mkdir -p /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler
RUN bundle

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

COPY . .
ENV RAILS_ENV=production
RUN bundle exec rails tailwindcss:install
RUN bundle exec rails assets:clean assets:precompile
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
