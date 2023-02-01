# README

Comment installer : 

Prendre un VPS 

Se connecter en SSH

git clone https://github.com/Fiyorden/messorder.git

bundle install

configurer le fichier config/database.yml

bundle exec rails db:create
bundle exec rails db:migrate

bundle exec sidekiq