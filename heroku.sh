heroku login

heroku container:login

heroku create heroku-rails-helhel

heroku container:push web

heroku container:release web

heroku addons:create heroku-postgresql:hobby-dev

heroku run rails db:migrate

# precompile
heroku run rake assets:precompile RAILS_ENV=production

heroku open