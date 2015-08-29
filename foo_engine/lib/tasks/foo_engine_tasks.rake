desc "migrate engine"
namespace :foo_engine do
  def establish_foo_db_connection
    ActiveRecord::Base.establish_connection FooEngine::Engine.db_conf
  end

  task :migrate do
    establish_foo_db_connection
    ActiveRecord::Migrator.migrate(FooEngine::Engine.root.join "db/migrate/")
  end

  task :rollback do
    establish_foo_db_connection
    ActiveRecord::Migrator.rollback(FooEngine::Engine.root.join "db/migrate/")
  end
end
