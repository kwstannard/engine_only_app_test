namespace :pg_engine do
  e_root = PgEngine::Engine.root
  db_namespace = namespace :db do
    task :establish_db_connection do
      ActiveRecord::Base.establish_connection PgEngine::Engine.db_conf
    end

    desc "prepare app to use engine db"
    task config_prepare: ['config/pg_database.yml']

    file 'config/database.yml' => P do
      Rails.root.join('config/database.yml').open("a+") do |f|
        f.write e_root.join('config/database.yml').read
      end
    end

    desc "migrates pg db"
    task migrate: [:establish_db_connection] do
      ActiveRecord::Migrator.migrate(e_root.join "db/migrate/")
      db_namespace['_dump'].invoke
    end

    task rollback: [:establish_db_connection] do
      ActiveRecord::Migrator.rollback(e_root.join "db/migrate/")
      db_namespace['_dump'].invoke
    end

    task :drop do
      ActiveRecord::Base.establish_connection PgEngine::Engine.base_db_conf
      conf = PgEngine::Engine.db_conf
      ActiveRecord::Base.connection.select_all "select pg_terminate_backend(pg_stat_activity.pid) from pg_stat_activity where datname='#{conf['database']}' AND state='idle';"
      ActiveRecord::Base.connection.drop_database(conf['database'])
    end

    task :create do
      ActiveRecord::Base.establish_connection PgEngine::Engine.base_db_conf
      conf = PgEngine::Engine.db_conf
      ActiveRecord::Base.connection.create_database(conf['database'], conf)
    end

    task :_dump do
      filename = "#{Rails.root}/db/pg_schema.rb"
      File.open(filename, 'w:utf-8') do |file|
        ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
      end
    end
  end
end

namespace :engines do
  namespace :db do
    task :migrate =>['pg_engine:db:migrate']
    task :rollback =>['pg_engine:db:rollback']
    task :drop =>['pg_engine:db:drop']
    task :create =>['pg_engine:db:create']
  end
end
namespace :db do
  namespace :test do
    # desc 'Purge and load foo_test schema'
    task load_schema: [:establish_db_connection] do
      # like db:test:purge
      abcs = ActiveRecord::Base.configurations
      ActiveRecord::Base.connection.recreate_database(
        abcs['pg_engine_test']['database'],
        mysql_creation_options(abcs['pg_engine_test'])
      )
      # like db:test:load_schema
      ActiveRecord::Schema.verbose = false
      load("#{Rails.root}/db/pg_schema.rb")
    end
  end
end
