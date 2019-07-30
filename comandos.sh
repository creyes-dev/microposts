# Instalar las gemas requeridas por la aplicación según las versiones epecificadas en el archivo Gemfile

~/ruby/microposts$ bundle install --without production
Fetching gem metadata from https://rubygems.org/.............
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies...
Using rake 12.3.3
Using concurrent-ruby 1.1.5
Using i18n 0.9.5
Using multi_json 1.13.1
Using activesupport 3.2.3
Using builder 3.0.4
Using activemodel 3.2.3
Using erubis 2.7.0
Using journey 1.0.4
Using rack 1.4.7
Using rack-cache 1.9.0
Using rack-test 0.6.3
Using hike 1.2.3
Using tilt 1.4.1
Using sprockets 2.1.4
Using actionpack 3.2.3
Using mime-types 1.25.1
Using polyglot 0.3.5
Using treetop 1.4.15
Using mail 2.4.4
Using actionmailer 3.2.3
Using arel 3.0.3
Using tzinfo 0.3.55
Using activerecord 3.2.3
Using activeresource 3.2.3
Using bundler 1.16.6
Using coffee-script-source 1.12.2
Using execjs 2.7.0
Using coffee-script 2.4.1
Using rack-ssl 1.3.4
Using json 1.8.6
Using rdoc 3.12.2
Using thor 0.14.6
Using railties 3.2.3
Using coffee-rails 3.2.2
Using ffi 1.11.1
Using jquery-rails 2.0.1 (was 3.1.5)
Using rails 3.2.3
Using rb-fsevent 0.10.3
Using rb-inotify 0.9.10
Using sass-listen 4.0.0
Using sass 3.7.4
Using sass-rails 3.2.4 (was 3.2.6)
Using sqlite3 1.3.5 (was 1.4.1)
Using uglifier 1.2.3 (was 4.1.20)
Bundle complete! 7 Gemfile dependencies, 45 gems now installed.
Gems in the group production were not installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.

# Creacion del recurso User

~/ruby/microposts$ rails generate scaffold User name:string email:string
        SECURITY WARNING: No secret option provided to Rack::Session::Cookie.
        This poses a security threat. It is strongly recommended that you
        provide a secret to prevent exploits that may be possible from crafted
        cookies. This will not be supported in future versions of Rack, and
        future versions will even invalidate your existing user cookies.

        Called from: /home/creyes-dev/.rvm/gems/ruby-2.0.0-p648/gems/actionpack-3.2.3/lib/action_dispatch/middleware/session/abstract_store.rb:28:in 'initialize'
      invoke  active_record
      create    db/migrate/20190730024420_create_users.rb
      create    app/models/user.rb
      invoke    test_unit
      create      test/unit/user_test.rb
      create      test/fixtures/users.yml
       route  resources :users
      invoke  scaffold_controller
      create    app/controllers/users_controller.rb
      invoke    erb
      create      app/views/users
      create      app/views/users/index.html.erb
      create      app/views/users/edit.html.erb
      create      app/views/users/show.html.erb
      create      app/views/users/new.html.erb
      create      app/views/users/_form.html.erb
      invoke    test_unit
      create      test/functional/users_controller_test.rb
      invoke    helper
      create      app/helpers/users_helper.rb
      invoke      test_unit
      create        test/unit/helpers/users_helper_test.rb
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/users.js.coffee
      invoke    scss
      create      app/assets/stylesheets/users.css.scss
      invoke  scss
      create    app/assets/stylesheets/scaffolds.css.scss

# Migrar la tabla User a la base de datos según la migración de tabla sugerida por la creación del recurso User

~/ruby/microposts$ bundle exec rake db:migrate
==  CreateUsers: migrating ====================================================
-- create_table(:users)
   -> 0.0016s
==  CreateUsers: migrated (0.0017s) ===========================================

