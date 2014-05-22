set :stage,     :staging
set :deploy_to, '/var/www/brutto_webapps_cz'
set :rails_env, 'staging'

server 'REPLACE_ME',
        user: 'brutto_webapps_cz',
        roles: %w(web app db)

