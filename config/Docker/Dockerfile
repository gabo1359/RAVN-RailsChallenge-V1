FROM ruby:3.3.5

WORKDIR /app

RUN apt-get update -qq && apt-get install -y curl gnupg2 sqlite3 libsqlite3-dev

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs
RUN npm install --global yarn

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000
