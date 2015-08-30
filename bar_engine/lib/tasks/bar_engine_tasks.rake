namespace :bar_engine do
  namespace :db do
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
end

namespace :engines do
  namespace :db do
    task :migrate =>['bar_engine:db:migrate']
    task :rollback =>['bar_engine:db:rollback']
    # no drop or create in sqlite
  end
end
