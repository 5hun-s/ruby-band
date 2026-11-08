FROM ruby:4.0

WORKDIR /app

COPY . .

CMD ["irb"]
