desc "migrate engine"
namespace :bar_engine do
  def establish_bar_db_connection
    ActiveRecord::Base.establish_connection BarEngine::Engine.db_conf
  end

  task :migrate do
    establish_bar_db_connection
    ActiveRecord::Migrator.migrate(BarEngine::Engine.root.join "db/migrate/")
  end

  task :rollback do
    establish_bar_db_connection
    ActiveRecord::Migrator.rollback(BarEngine::Engine.root.join "db/migrate/")
  end
end
