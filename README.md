# template-docker-symfony
ONLY for DEV, not for production

A very simple Docker-compose

# Run Locally
## Clone the project

  git clone git@github.com:jherbaux/template-docker-symfony.git

## Run the docker-compose

  make install

## Log into the PHP container

  make php

## Create your Symfony application and launch the internal server

  symfony new project --webapp

Pour le moment, le projet doit porter le nom de "project"


Your application is available at http://localhost

