class CreateBarEngineTrucks < ActiveRecord::Migration
  def change
    create_table :bar_engine_trucks do |t|
      t.string :make
      t.string :model

      t.timestamps null: false
    end
  end
end
