== README

# Initial model setup

rails generate model User name:string email:string password_digest:string remember_token:string
bundle exec rake db:migrate

rails generate scaffold Coral location:string exposure:string image_id:integer species:string growth_form:string distance:decimal notes:text
bundle exec rake db:migrate

.mode csv
.import corals.csv corals



<!-- rails generate model Measurement coral:references measurement_name:string measurement_value:decimal 
bundle exec rake db:migrate -->

# Production

    $ bundle exec rake db:migrate RAILS_ENV="production"
    $ rake tmp:clear
    $ bundle exec rake assets:precompile RAILS_ENV=production RAILS_GROUPS=assets
    $ rails s -e production -p 3000
