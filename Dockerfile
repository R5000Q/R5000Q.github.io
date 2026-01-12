FROM ruby:3.2

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /site

RUN gem install bundler && gem install github-pages

EXPOSE 4000

CMD ["bash", "-lc", "jekyll serve --host 0.0.0.0 --port 4000 --livereload --force_polling"]
