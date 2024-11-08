# Gunakan image Rails yang sudah ada
FROM ruby:3.1

# Install dependensi sistem
RUN apt-get update -qq && apt-get install -y \
    nodejs \
    yarn \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Set direktori kerja
WORKDIR /app

# Salin file Gemfile dan Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Salin seluruh kode aplikasi ke dalam container
COPY . .

# Expose port yang akan digunakan
EXPOSE 3000

# Perintah untuk menjalankan server Rails
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
