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
 
# Agregar la columna add_index_to_users_email a la tabla Users

~/ruby/microposts$ rails generate migration add_index_to_users_email

      invoke  active_record
      create    db/migrate/20190804045211_add_index_to_users_email.rb

# Migrar los cambios a la base de datos

~/ruby/microposts$ bundle exec rake db:migrate
rake aborted!
NoMethodError: undefined method 'last_comment' for #<Rake::Application:0x005585b839a3f8>
/home/creyes-dev/.rvm/gems/ruby-2.0.0-p648/gems/rspec-core-2.9.0/lib/rspec/core/rake_task.rb:124:in 'initialize'
/home/creyes-dev/.rvm/gems/ruby-2.0.0-p648/gems/rspec-rails-2.9.0/lib/rspec/rails/tasks/rspec.rake:19:in 'new'
/home/creyes-dev/.rvm/gems/ruby-2.0.0-p648/gems/rspec-rails-2.9.0/lib/rspec/rails/tasks/rspec.rake:19:in '<top (required)>'

# Algo se rompio... pero lo arregle, gemfile.lock apuntaba a rake 12.3.3, correspondia 0.9.6

~/ruby/microposts$ bundle exec rake db:migrate
==  AddIndexToUsersEmail: migrating ===========================================
==  AddIndexToUsersEmail: migrated (0.0000s) ==================================

# Pero noté que la migración no contiene ningun cambio:

#class AddIndexToUsersEmail < ActiveRecord::Migration
#  def change
#  end
#end

# Procedo a hacer un rollback de la migración y volver a efectuarla

~/ruby/microposts$ rake db:rollback STEP=1
==  AddIndexToUsersEmail: reverting ===========================================
==  AddIndexToUsersEmail: reverted (0.0000s) ==================================

~/ruby/microposts$ rake db:migrate:status

database: db/development.sqlite3

 Status   Migration ID    Migration Name
--------------------------------------------------
   up     20190730024420  Create users
   up     20190730042309  Create microposts
  down    20190804045211  Add index to users email

# Vuelvo a generar la migración

~/ruby/microposts$ rails generate migration add_index_to_users_email

      invoke  active_record
      create    db/migrate/20190804052749_add_index_to_users_email.rb

# Me di cuenta que hay que programar la migración, debemos agregar manualmente 
# la instrucción de agregar un indice por el nombre y el email

# ahora si migrar los cambios 

~/ruby/microposts$ bundle exec rake db:migrate
==  AddIndexToUsersEmail: migrating ===========================================
-- add_index(:users, :email, {:unique=>true})
   -> 0.0005s
==  AddIndexToUsersEmail: migrated (0.0006s) ==================================

~/ruby/microposts$ rake db:migrate:status

database: db/development.sqlite3

 Status   Migration ID    Migration Name
--------------------------------------------------
   up     20190730024420  Create users
   up     20190730042309  Create microposts
   up     20190804052749  Add index to users email

# Instalar bcrypt-ruby 3.0.1

~/ruby/microposts$ bundle install
Fetching gem metadata from https://rubygems.org/.............
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies...
Using rake 0.9.6
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
Fetching bcrypt-ruby 3.0.1
Installing bcrypt-ruby 3.0.1 with native extensions
Using bootstrap-sass 2.0.0
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
Bundle complete! 11 Gemfile dependencies, 61 gems now installed.
Gems in the group production were not installed.
Use 'bundle info [gemname]' to see where a bundled gem is installed.

# Agregar la columna password_digest a la tabla users 

~/ruby/microposts$ rails generate migration add_password_digest_to_users password_digest:string

      invoke  active_record
      create    db/migrate/20190804055002_add_password_digest_to_users.rb

# Migrar la nueva columna a la base de datos

creyes-dev@creyes:~/ruby/microposts$ bundle exec rake db:migrate
==  AddPasswordDigestToUsers: migrating =======================================
-- add_column(:users, :password_digest, :string)
   -> 0.0004s
==  AddPasswordDigestToUsers: migrated (0.0005s) ==============================

# Aplicar todos los cambios en la base de datos utilizada para testing

~/ruby/microposts$ rake db:test:prepare

# Al verificar el resultados de las pruebas me encuentro con un error, se requiere corregirlo para poder verificar 
# que las pruebas se estén completando

~/ruby/microposts$ bundle exec rspec spec/

        Called from: /home/creyes-dev/.rvm/gems/ruby-2.0.0-p648/gems/actionpack-3.2.3/lib/action_dispatch/middleware/session/abstract_store.rb:28:in 'initialize'.
Rack::File headers parameter replaces cache_control after Rack 1.5.
/home/creyes-dev/.rvm/gems/ruby-2.0.0-p648/gems/activemodel-3.2.3/lib/active_model/validations/length.rb:27:in 'check_validity!': Range unspecified. Specify the :in, :within, :maximum, :minimum, or :is option. (ArgumentError)
	from /home/creyes-dev/.rvm/gems/ruby-2.0.0-p648/gems/activemodel-3.2.3/lib/active_model/validator.rb:143:in 'initialize'

# Me olvide de generar la migración de agregar la columna password

~/ruby/microposts$ rails generate migration add_password_to_users password:string

      invoke  active_record
      create    db/migrate/20190804172731_add_password_to_users.rb

~/ruby/microposts$ bundle exec rake db:migrate
==  AddPasswordToUsers: migrating =============================================
-- add_column(:users, :password, :string)
   -> 0.0004s
==  AddPasswordToUsers: migrated (0.0004s) ====================================

# Instanciar objetos User para verificar que se cumplan las validaciones

rails console
2.0.0-p648 :001 > u = User.new(password_confirmation: "hey")
ActiveRecord::UnknownAttributeError: unknown attribute: password_confirmation

# La tabla User no debe contener la columna password, solo debe mantener la columna password_digest

~/ruby/microposts$ rake db:rollback STEP=1
==  AddPasswordToUsers: reverting =============================================
-- remove_column("users", :password)
   -> 0.0283s
==  AddPasswordToUsers: reverted (0.0284s) ====================================

~/ruby/microposts$ rake db:migrate:status

database: db/development.sqlite3

 Status   Migration ID    Migration Name
--------------------------------------------------
   up     20190730024420  Create users
   up     20190730042309  Create microposts
   up     20190804052749  Add index to users email
   up     20190804055002  Add password digest to users
  down    20190804172731  Add password to users

# Probar validaciones

2.0.0-p648 :001 > u = User.new(name: "nombre", email: "mail", password: "abc123", password_confirmation: "abc123")
 => #<User id: nil, name: "nombre", email: "mail", created_at: nil, updated_at: nil, password_digest: "$2a$10$vmbg53B7b19.j/UEHvVOleInSn1xRZlzPG12i51g9N7N..."> 
2.0.0-p648 :002 > u.valid?
  User Exists (0.2ms)  SELECT 1 FROM "users" WHERE LOWER("users"."email") = LOWER('mail') LIMIT 1
 => false 
2.0.0-p648 :003 > u.errors.full_messages
 => ["Email is invalid"] 

2.0.0-p648 :004 > u = User.new(name: " ", email: "", password: "abc123", password_confirmation: "abc123")
 => #<User id: nil, name: " ", email: "", created_at: nil, updated_at: nil, password_digest: "$2a$10$OTyKPQzhXLG43ftR2d.YU.gtFoofVdlsX0XNoS9bzER/..."> 
2.0.0-p648 :005 > u.valid?
  User Exists (0.2ms)  SELECT 1 FROM "users" WHERE LOWER("users"."email") = LOWER('') LIMIT 1
 => false 
2.0.0-p648 :006 > u.errors.full_messages => ["Name can't be blank", "Email can't be blank", "Email is invalid"] 

2.0.0-p648 :008 > u.valid?
  User Exists (0.2ms)  SELECT 1 FROM "users" WHERE LOWER("users"."email") = LOWER('mail@mail.com') LIMIT 1
 => false 
2.0.0-p648 :009 > u.errors.full_messages => ["Password doesn't match confirmation", "Password is too short (minimum is 6 characters)"] 

# Instanciar y registrar un nuevo User en la base de datos

2.0.0-p648 :015 > User.create(name: "Cristian", email:"cr@mail.com", password: "pass123456", password_confirmation: "pass123456")
   (0.1ms)  begin transaction
  User Exists (0.1ms)  SELECT 1 FROM "users" WHERE LOWER("users"."email") = LOWER('cr@mail.com') LIMIT 1
Binary data inserted for `string` type on column `password_digest`
  SQL (19.4ms)  INSERT INTO "users" ("created_at", "email", "name", "password_digest", "updated_at") VALUES (?, ?, ?, ?, ?)  [["created_at", Tue, 06 Aug 2019 02:32:38 UTC +00:00], ["email", "cr@mail.com"], ["name", "Cristian"], ["password_digest", "$2a$10$70YDYrsFp.d8nvxAtIvilOdFyViNzjE3VANw4UICCmvpQD3TGwGQS"], ["updated_at", Tue, 06 Aug 2019 02:32:38 UTC +00:00]]
   (89.9ms)  commit transaction
 => #<User id: 2, name: "Cristian", email: "cr@mail.com", created_at: "2019-08-06 02:32:38", updated_at: "2019-08-06 02:32:38", password_digest: "$2a$10$70YDYrsFp.d8nvxAtIvilOdFyViNzjE3VANw4UICCmvp..."> 
2.0.0-p648 :016 > User.all
  User Load (0.2ms)  SELECT "users".* FROM "users" 
 => [#<User id: 2, name: "Cristian", email: "cr@mail.com", created_at: "2019-08-06 02:32:38", updated_at: "2019-08-06 02:32:38", password_digest: "$2a$10$70YDYrsFp.d8nvxAtIvilOdFyViNzjE3VANw4UICCmvp...">] 

# Probar la autenticación del usuario registrado

2.0.0-p648 :018 > u.authenticate("password_no_valido")
 => false 
2.0.0-p648 :020 > u.authenticate("pass123456")
 => #<User id: 2, name: "Cristian", email: "cr@mail.com", created_at: "2019-08-06 02:32:38", updated_at: "2019-08-06 02:32:38", password_digest: "$2a$10$70YDYrsFp.d8nvxAtIvilOdFyViNzjE3VANw4UICCmvp..."> 

# Instalar factory girl

~/ruby/microposts$ bundle install
Fetching gem metadata from https://rubygems.org/.............
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies...
Using rake 0.9.6
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
Using bcrypt-ruby 3.0.1
Using bootstrap-sass 2.0.0
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
Fetching factory_girl 2.3.2
Installing factory_girl 2.3.2
Fetching factory_girl_rails 1.4.0
Installing factory_girl_rails 1.4.0
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
Bundle complete! 12 Gemfile dependencies, 63 gems now installed.
Gems in the group production were not installed.
Use 'bundle info [gemname]' to see where a bundled gem is installed.

# Crear un nuevo usuario para probar gravatar
~/ruby/microposts$ rails console

2.0.0-p648 :001 > User.create(name: "Mr Rails", email:"example@railstutorial.org", password: "Foobar20", password_confirmation: "Foobar20")
   (0.1ms)  begin transaction
  User Exists (18.1ms)  SELECT 1 FROM "users" WHERE LOWER("users"."email") = LOWER('example@railstutorial.org') LIMIT 1
Binary data inserted for `string` type on column `password_digest`
  SQL (22.8ms)  INSERT INTO "users" ("created_at", "email", "name", "password_digest", "updated_at") VALUES (?, ?, ?, ?, ?)  [["created_at", Sat, 10 Aug 2019 15:31:12 UTC +00:00], ["email", "example@railstutorial.org"], ["name", "Mr Rails"], ["password_digest", "$2a$10$d7yrnwNjtUcJHaGygUAgmu3TOCXYiM5WzBjUH57K4a/fHWTkIBJli"], ["updated_at", Sat, 10 Aug 2019 15:31:12 UTC +00:00]]
   (99.6ms)  commit transaction
 => #<User id: 3, name: "Mr Rails", email: "example@railstutorial.org", created_at: "2019-08-10 15:31:12", updated_at: "2019-08-10 15:31:12", password_digest: "$2a$10$d7yrnwNjtUcJHaGygUAgmu3TOCXYiM5WzBjUH57K4a/f..."> 


