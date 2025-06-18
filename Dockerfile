FROM ruby:3.3

RUN apt-get update && \
    apt-get install -y build-essential libpq-dev libffi-dev nodejs && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /srv/jekyll

COPY Gemfile Gemfile.lock ./

RUN gem install bundler && bundle install

COPY . . 

CMD ["bundle", "exec", "jekyll", "serve", "--watch", "--force_polling", "--host", "0.0.0.0"]