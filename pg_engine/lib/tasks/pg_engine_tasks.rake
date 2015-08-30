namespace :pg_engine do
  namespace :db do
  task :establish_db_connection do
    ActiveRecord::Base.establish_connection PgEngine::Engine.db_conf
  end

  task migrate: [:establish_db_connection] do
    ActiveRecord::Migrator.migrate(PgEngine::Engine.root.join "db/migrate/")
  end

  task rollback: [:establish_db_connection] do
    ActiveRecord::Migrator.rollback(PgEngine::Engine.root.join "db/migrate/")
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
