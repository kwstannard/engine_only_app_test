desc "migrate engine"
namespace :foo_engine do
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
