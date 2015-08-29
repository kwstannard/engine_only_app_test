class CreateBarEngineTrucks < ActiveRecord::Migration
  def change
    create_table :foo_engine_trucks do |t|
      t.string :make
      t.string :model

      t.timestamps null: false
    end
  end
end
