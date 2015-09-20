require 'byebug'
namespace :foo_engine do
  db_namespace = namespace :db do
    task :establish_db_connection do
      ActiveRecord::Base.establish_connection FooEngine::Engine.db_conf
    end

    desc "migrates foo db"
    task migrate: [:establish_db_connection] do
      ActiveRecord::Migrator.migrate(FooEngine::Engine.root.join "db/migrate/")
      db_namespace['_dump'].invoke
    end

    task rollback: [:establish_db_connection] do
      ActiveRecord::Migrator.rollback(FooEngine::Engine.root.join "db/migrate/")
      db_namespace['_dump'].invoke
    end

    task :_dump do
      if Pathname.pwd.join('../../foo_engine.gemspec').exist?
        filename = "#{FooEngine::Engine.root}/db/schema.rb"
        File.open(filename, 'w:utf-8') do |file|
          ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
        end
      end
    end
  end
end

namespace :engines do
  namespace :db do
    task :migrate =>['foo_engine:db:migrate']
    task :rollback =>['foo_engine:db:rollback']
    # no drop or create in sqlite
  end
end

namespace :db do
  namespace :test do
    # desc 'Purge and load foo_test schema'
    task load_schema: [:establish_db_connection] do
      # like db:test:purge
      abcs = ActiveRecord::Base.configurations
      ActiveRecord::Base.connection.recreate_database(
        abcs['foo_test']['database'],
        mysql_creation_options(abcs['foo_test'])
      )
      # like db:test:load_schema
      ActiveRecord::Schema.verbose = false
      load("#{FooEngine::Engine.root}/db/foo_schema.rb")
    end
  end
end
