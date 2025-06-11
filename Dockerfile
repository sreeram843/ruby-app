FROM ruby:3.2

WORKDIR /app

# Install dependencies
COPY . .
RUN bundle install

# Expose Sinatra default port
EXPOSE 4567

# Start the app
CMD ["ruby", "app.rb", "-o", "0.0.0.0"]