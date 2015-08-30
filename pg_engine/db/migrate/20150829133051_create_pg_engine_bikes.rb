class CreatePgEngineBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string :make
      t.string :model

      t.timestamps null: false
    end
  end
end
