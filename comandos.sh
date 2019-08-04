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

# Creacion del recurso Micropost

~/ruby/microposts$ rails generate scaffold Micropost content:string user_id:integer
        SECURITY WARNING: No secret option provided to Rack::Session::Cookie.
        This poses a security threat. It is strongly recommended that you
        provide a secret to prevent exploits that may be possible from crafted
        cookies. This will not be supported in future versions of Rack, and
        future versions will even invalidate your existing user cookies.

        Called from: /home/creyes-dev/.rvm/gems/ruby-2.0.0-p648/gems/actionpack-3.2.3/lib/action_dispatch/middleware/session/abstract_store.rb:28:in 'initialize'.
      invoke  active_record
      create    db/migrate/20190730042309_create_microposts.rb
      create    app/models/micropost.rb
      invoke    test_unit
      create      test/unit/micropost_test.rb
      create      test/fixtures/microposts.yml
       route  resources :microposts
      invoke  scaffold_controller
      create    app/controllers/microposts_controller.rb
      invoke    erb
      create      app/views/microposts
      create      app/views/microposts/index.html.erb
      create      app/views/microposts/edit.html.erb
      create      app/views/microposts/show.html.erb
      create      app/views/microposts/new.html.erb
      create      app/views/microposts/_form.html.erb
      invoke    test_unit
      create      test/functional/microposts_controller_test.rb
      invoke    helper
      create      app/helpers/microposts_helper.rb
      invoke      test_unit
      create        test/unit/helpers/microposts_helper_test.rb
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/microposts.js.coffee
      invoke    scss
      create      app/assets/stylesheets/microposts.css.scss
      invoke  scss
   identical    app/assets/stylesheets/scaffolds.css.scss
creyes-dev@creyes:~/ruby/microposts$ 


# Migrar la tabla Micropost a la base de datos según la migración de tabla sugerida por la creación del recurso Micropost

~/ruby/microposts$ bundle exec rake db:migrate
==  CreateMicroposts: migrating ===============================================
-- create_table(:microposts)
   -> 0.0185s
==  CreateMicroposts: migrated (0.0186s) ======================================

# Verificar la relación entre User y Micropost

~/ruby/microposts$ rails console
Loading development environment (Rails 3.2.3)
2.0.0-p648 :001 > first_user = User.first
  User Load (0.1ms)  SELECT "users".* FROM "users" LIMIT 1
 => #<User id: 1, name: "Cristian", email: "creyes.dev@gmail.com", created_at: "2019-07-30 03:25:37", updated_at: "2019-07-30 03:27:21"> 
2.0.0-p648 :002 > first_user.microposts
  Micropost Load (0.1ms)  SELECT "microposts".* FROM "microposts" WHERE "microposts"."user_id" = 1
 => [#<Micropost id: 1, content: "Este es mi primer post!", user_id: 1, created_at: "2019-07-30 23:39:31", updated_at: "2019-07-30 23:39:31">] 

# Instalar nuevas gemas requeridas por la aplicación, en entorno de desarrollo y testing 
# se instala rspec-rails y en entorno de testing unicamente se instala capybara 

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
Fetching mini_portile2 2.1.0
Installing mini_portile2 2.1.0
Fetching nokogiri 1.6.8.1
Installing nokogiri 1.6.8.1 with native extensions
Using ffi 1.11.1
Fetching childprocess 0.9.0
Installing childprocess 0.9.0
Fetching rubyzip 1.2.3
Installing rubyzip 1.2.3
Fetching websocket 1.2.8
Installing websocket 1.2.8
Fetching selenium-webdriver 2.53.4
Installing selenium-webdriver 2.53.4
Fetching xpath 0.1.4
Installing xpath 0.1.4
Fetching capybara 1.1.2
Installing capybara 1.1.2
Using coffee-script-source 1.12.2
Using execjs 2.7.0
Using coffee-script 2.4.1
Using rack-ssl 1.3.4
Using json 1.8.6
Using rdoc 3.12.2
Using thor 0.14.6
Using railties 3.2.3
Using coffee-rails 3.2.2
Fetching diff-lcs 1.1.3
Installing diff-lcs 1.1.3
Using jquery-rails 2.0.1
Using rails 3.2.3
Using rb-fsevent 0.10.3
Using rb-inotify 0.9.10
Fetching rspec-core 2.9.0
Installing rspec-core 2.9.0
Fetching rspec-expectations 2.9.1
Installing rspec-expectations 2.9.1
Fetching rspec-mocks 2.9.0
Installing rspec-mocks 2.9.0
Fetching rspec 2.9.0
Installing rspec 2.9.0
Fetching rspec-rails 2.9.0
Installing rspec-rails 2.9.0
Using sass-listen 4.0.0
Using sass 3.7.4
Using sass-rails 3.2.4
Using sqlite3 1.3.5
Using uglifier 1.2.3
Bundle complete! 9 Gemfile dependencies, 59 gems now installed.
Gems in the group production were not installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.

# Indicarle a Rails que vamos a usar RSpec en lugar de Test::Unit

~/ruby/microposts$ rails generate rspec:install
      create  .rspec
      create  spec
      create  spec/spec_helper.rb

~/ruby/microposts$ rails generate rspec:install

   identical  .rspec
       exist  spec
   identical  spec/spec_helper.rb

# Crear el controller StaticPages, el mismo está compuesto de dos acciones definidas: home y help

~/ruby/microposts$ rails generate controller StaticPages home help --no-test-framework

      create  app/controllers/static_pages_controller.rb
       route  get "static_pages/help"
       route  get "static_pages/home"
      invoke  erb
      create    app/views/static_pages
      create    app/views/static_pages/home.html.erb
      create    app/views/static_pages/help.html.erb
      invoke  helper
      create    app/helpers/static_pages_helper.rb
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/static_pages.js.coffee
      invoke    scss
      create      app/assets/stylesheets/static_pages.css.scss

# Crear un test de integración (simula la interacción del usuario con el sistema) con el controller static_pages

~/ruby/microposts$ rails generate integration_test static_pages

        Called from: /home/creyes-dev/.rvm/gems/ruby-2.0.0-p648/gems/actionpack-3.2.3/lib/action_dispatch/middleware/session/abstract_store.rb:28:in 'initialize'.
      invoke  rspec
      create    spec/requests/static_pages_spec.rb

# Ejecutar rspec para obtener el resultado del test de integración

~/ruby/microposts$ bundle exec rspec spec/requests/static_pages_spec.rb

Failures:

  1) StaticPages Home page deberia tener el contenido 'Sample app'
     Failure/Error: page.should have_content('Sample App')
       expected there to be content "Sample App" in "\n\n  Microposts\n  \n  \n  \n\n\n\nStaticPages#home\nFind me in app/views/static_pages/home.html.erb\n\n\n\n"
     # ./spec/requests/static_pages_spec.rb:7:in `block (3 levels) in <top (required)>'

Finished in 0.26622 seconds
1 example, 1 failure

Failed examples:

rspec ./spec/requests/static_pages_spec.rb:5 # StaticPages Home page deberia tener el contenido 'Sample app'

# Volver a ejecutar el test de integración

~/ruby/microposts$ bundle exec rspec spec/requests/static_pages_spec.rb

Rack::File headers parameter replaces cache_control after Rack 1.5.
.

Finished in 0.10613 seconds
1 example, 0 failures

~/ruby/microposts$ bundle exec rspec spec/requests/static_pages_spec.rb

Finished in 0.12128 seconds
6 examples, 0 failures

# Instalar bootstrap-sass

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
Fetching bootstrap-sass 2.0.0
Installing bootstrap-sass 2.0.0
Using bundler 1.16.6
Using mini_portile2 2.1.0
Using nokogiri 1.6.8.1
Using ffi 1.11.1
Using childprocess 0.9.0
Using rubyzip 1.2.3
Using websocket 1.2.8
Using selenium-webdriver 2.53.4
Using xpath 0.1.4
Using capybara 1.1.2
Using coffee-script-source 1.12.2
Using execjs 2.7.0
Using coffee-script 2.4.1
Using rack-ssl 1.3.4
Using json 1.8.6
Using rdoc 3.12.2
Using thor 0.14.6
Using railties 3.2.3
Using coffee-rails 3.2.2
Using diff-lcs 1.1.3
Using jquery-rails 2.0.1
Using rails 3.2.3
Using rb-fsevent 0.10.3
Using rb-inotify 0.9.10
Using rspec-core 2.9.0
Using rspec-expectations 2.9.1
Using rspec-mocks 2.9.0
Using rspec 2.9.0
Using rspec-rails 2.9.0
Using sass-listen 4.0.0
Using sass 3.7.4
Using sass-rails 3.2.4
Using sqlite3 1.3.5
Using uglifier 1.2.3
Bundle complete! 10 Gemfile dependencies, 60 gems now installed.
Gems in the group production were not installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.

# Generar tests de integración de las páginas relacionadas con la gestión de usuarios

~/ruby/microposts$ rails generate integration_test user_pages

      invoke  rspec
      create    spec/requests/user_pages_spec.rb

# Crear un objeto del modelo User en la consola sin persistirlo

~/ruby/microposts$ rails console --sandbox

2.0.0-p648 :003 > User.all
  User Load (0.2ms)  SELECT "users".* FROM "users" 
 => [#<User id: 1, name: "Cristian", email: "creyes.dev@gmail.com", created_at: "2019-07-30 03:25:37", updated_at: "2019-07-30 03:27:21">] 
2.0.0-p648 :004 > user = User.new(name: "Mr Console", email: "imconsole@mail.com")
 => #<User id: nil, name: "Mr Console", email: "imconsole@mail.com", created_at: nil, updated_at: nil> 
2.0.0-p648 :005 > User.all
  User Load (0.1ms)  SELECT "users".* FROM "users" 
 => [#<User id: 1, name: "Cristian", email: "creyes.dev@gmail.com", created_at: "2019-07-30 03:25:37", updated_at: "2019-07-30 03:27:21">] 
2.0.0-p648 :006 > user.save
   (0.1ms)  SAVEPOINT active_record_1
  SQL (40.3ms)  INSERT INTO "users" ("created_at", "email", "name", "updated_at") VALUES (?, ?, ?, ?)  [["created_at", Sun, 04 Aug 2019 00:44:24 UTC +00:00], ["email", "imconsole@mail.com"], ["name", "Mr Console"], ["updated_at", Sun, 04 Aug 2019 00:44:24 UTC +00:00]]
   (0.1ms)  RELEASE SAVEPOINT active_record_1
 => true 
2.0.0-p648 :007 > User.all
  User Load (0.1ms)  SELECT "users".* FROM "users" 
 => [ #<User id: 1, name: "Cristian", email: "creyes.dev@gmail.com", created_at: "2019-07-30 03:25:37", updated_at: "2019-07-30 03:27:21">, 
      #<User id: 2, name: "Mr Console", email: "imconsole@mail.com", created_at: "2019-08-04 00:44:24", updated_at: "2019-08-04 00:44:24">]

# Buscar un registro con un valor específico utilizando find_by_*

2.0.0-p648 :008 > User.find_by_email("imconsole@mail.com")
  User Load (0.1ms)  SELECT "users".* FROM "users" WHERE "users"."email" = 'imconsole@mail.com' LIMIT 1
 => #<User id: 2, name: "Mr Console", email: "imconsole@mail.com", created_at: "2019-08-04 00:44:24", updated_at: "2019-08-04 00:44:24"> 

# Modificar la propiedad email utilizando el método reload

2.0.0-p648 :009 > user.email = "imconsole@rails.com"
 => "imconsole@rails.com" 
2.0.0-p648 :012 > user.reload.email
  User Load (0.1ms)  SELECT "users".* FROM "users" WHERE "users"."id" = ? LIMIT 1  [["id", 2]]
 => "imconsole@mail.com" 

# Modificar varios valores de un objeto y almacenarlas en la base de datos al mismo tiempo utilizando update_attributes

2.0.0-p648 :014 > user.update_attributes(name: "Mr. Console", email: "console_san@yahoo.co.jp")
   (0.1ms)  SAVEPOINT active_record_1
   (0.1ms)  UPDATE "users" SET "name" = 'Mr. Console', "email" = 'console_san@yahoo.co.jp', "updated_at" = '2019-08-04 00:53:28.882286' WHERE "users"."id" = 2
   (0.1ms)  RELEASE SAVEPOINT active_record_1
 => true 
2.0.0-p648 :015 > user.email
 => "console_san@yahoo.co.jp" 

# Al salir se pierden los cambios por ejecutar rails console --sandbox

2.0.0-p648 :016 > exit
   (0.2ms)  rollback transaction

# Crear pruebas unitarias de los objetos de la clase /app/models/User

~/ruby/microposts$ bundle exec rspec spec/models/user_spec.rb

# La base de datos en ambiente de testing no sabe acerca del modelo de datos, procedemos a crear 
# una base de datos de testing que posea la estructura correcta

~/ruby/microposts$ bundle exec rake db:test:prepare
rake aborted!
NoMethodError: undefined method 'last_comment' for #<Rake::Application:0x0055a0c4156520>
/home/creyes-dev/.rvm/gems/ruby-2.0.0-p648/gems/rspec-core-2.9.0/lib/rspec/core/rake_task.rb:124:in 'initialize'

# Probar validates :name, presence: true en User

~/ruby/microposts$ rails console --sandbox
2.0.0-p648 :001 > u = User.new(name: "", email: "test@mail.com")
 => #<User id: nil, name: "", email: "test@mail.com", created_at: nil, updated_at: nil> 
2.0.0-p648 :003 > u.save
   (0.1ms)  SAVEPOINT active_record_1
   (0.1ms)  ROLLBACK TO SAVEPOINT active_record_1
 => false 
2.0.0-p648 :005 > u.valid?
 => false 
2.0.0-p648 :006 > u.errors
 => #<ActiveModel::Errors:0x00560b73630b08 @base=#<User id: nil, name: "", email: "test@mail.com", created_at: nil, updated_at: nil>, @messages={:name=>["can't be blank"]}> 
2.0.0-p648 :007 > u.errors.full_messages
 => ["Name can't be blank"] 
 

