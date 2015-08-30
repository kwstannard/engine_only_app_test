namespace :engines do
  namespace :db do
    desc "setup the databases"
    task :migrate do
      # Add this to your engine to extend this task
=begin
namespace :engines do
  namespace :db do
    task :migrate =>['your_engine:db:migrate']
=end
    end
  end
end
