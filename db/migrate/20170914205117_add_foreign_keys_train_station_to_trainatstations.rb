class AddForeignKeysTrainStationToTrainatstations < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :trainatstations, :trains
    add_foreign_key :trainatstations, :stations
  end
end
