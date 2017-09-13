class CreateTrainatstations < ActiveRecord::Migration[5.1]
  def change
    create_table :trainatstations do |t|
      t.integer :train_id
      t.integer :station_id
      t.timestamp :time

      t.timestamps
    end
  end
end
