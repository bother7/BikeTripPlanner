class CreateTrains < ActiveRecord::Migration[5.1]
  def change
    create_table :trains do |t|
      t.string :trip_id
      t.string :route
      t.string :direction
      t.integer :delay

      t.timestamps
    end
  end
end
