require "active_support/core_ext/string"

EngineOnlyHelpers.engine_namespaces.each do |engine_namespace|
  name = engine_namespace.name.underscore
  engine = engine_namespace::Engine

  namespace name do
    db_namespace = namespace :db do
      task :establish_db_connection do
        ActiveRecord::Base.establish_connection engine_namespace.db_conf
      end

      desc "migrates #{name} db"
      task migrate: [:establish_db_connection] do
        ActiveRecord::Migrator.migrate(engine.root.join "db/migrate/")
        db_namespace["_dump"].invoke
      end

      desc "rolls back #{name} db"
      task rollback: [:establish_db_connection] do
        ActiveRecord::Migrator.rollback(engine.root.join "db/migrate/")
        db_namespace["_dump"].invoke
      end

      desc "drops #{name}'s database"
      task :drop do
        ActiveRecord::Base.establish_connection PgEngine::Engine.base_db_conf
        conf = PgEngine::Engine.db_conf
        ActiveRecord::Base.connection.select_all "select pg_terminate_backend(pg_stat_activity.pid) from pg_stat_activity where datname='#{conf["database"]}' AND state='idle';"
        ActiveRecord::Base.connection.drop_database(conf["database"])
      end

      desc "creates #{name}'s database"
      task :create do
        ActiveRecord::Base.establish_connection PgEngine::Engine.base_db_conf
        conf = PgEngine::Engine.db_conf
        ActiveRecord::Base.connection.create_database(conf["database"], conf)
      end

      task :_dump do
        if Pathname.pwd.join("../../#{name}.gemspec").exist?
          filename = "#{engine.root}/db/schema.rb"
          File.open(filename, "w:utf-8") do |file|
            ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
          end
        end
      end
    end
  end

  namespace :engines do
    namespace :db do
      task :migrate =>["#{name}:db:migrate"]
      task :rollback =>["#{name}:db:rollback"]
      task :drop =>["#{name}:db:drop"]
      task :create =>["#{name}:db:create"]
    end
  end

  namespace :db do
    namespace :test do
      # desc "Purge and load foo_test schema"
      task load_schema: [:establish_db_connection] do
        # like db:test:purge
        abcs = ActiveRecord::Base.configurations
        ActiveRecord::Base.connection.recreate_database(
          abcs["#{name}_test"]["database"],
          mysql_creation_options(abcs["#{name}_test"])
        )
        # like db:test:load_schema
        ActiveRecord::Schema.verbose = false
        load("#{engine.root}/db/schema.rb")
      end
    end
  end
end
