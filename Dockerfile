FROM ruby:2.5.0

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs 
RUN apt-get update -qq && apt-get install -y imagemagick libmagick++-dev \
  build-essential \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /app_name

ENV APP_ROOT /app_name 
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD . $APP_ROOT