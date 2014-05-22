set :stage,     :production
set :rails_env, 'production'
set :deploy_to, '/var/www/brutto_com'

server 'REPLACE_ME',
       user: 'brutto',
       roles: %w(web app db)
