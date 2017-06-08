# Usa essa imagem para gerar nosso container
FROM ruby:2.3
# Instala nossas dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    build-essential nodejs libpq-dev imagemagick
# Seta nosso path
ENV INSTALL_PATH /hack2save
# Cria nosso diretório
RUN mkdir -p $INSTALL_PATH
# Seta o nosso path como o diretório principal
WORKDIR $INSTALL_PATH
# Copia o nosso Gemfile para dentro do container
COPY Gemfile Gemfile.lock ./
# Seta o path para as Gems
ENV BUNDLE_PATH /box
# Copia nosso código para dentro do container
COPY . .
