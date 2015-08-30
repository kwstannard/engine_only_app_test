namespace :foo_engine do
  namespace :db do
    task :establish_db_connection do
      ActiveRecord::Base.establish_connection FooEngine::Engine.db_conf
    end

    task migrate: [:establish_db_connection] do
      ActiveRecord::Migrator.migrate(FooEngine::Engine.root.join "db/migrate/")
    end

    task rollback: [:establish_db_connection] do
      ActiveRecord::Migrator.rollback(FooEngine::Engine.root.join "db/migrate/")
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
