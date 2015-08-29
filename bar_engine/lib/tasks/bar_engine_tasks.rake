desc "migrate engine"
namespace :bar_engine do
  task :establish_db_connection do
    ActiveRecord::Base.establish_connection BarEngine::Engine.db_conf
  end

  task migrate: [:establish_db_connection] do
    ActiveRecord::Migrator.migrate(BarEngine::Engine.root.join "db/migrate/")
  end

  task rollback: [:establish_db_connection] do
    ActiveRecord::Migrator.rollback(BarEngine::Engine.root.join "db/migrate/")
  end
end
