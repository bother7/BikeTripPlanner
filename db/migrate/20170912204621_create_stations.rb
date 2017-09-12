class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :stop_id
      t.string :name
      t.string :lat
      t.string :lon
      t.string :parent_id

      t.timestamps
    end
  end
end
