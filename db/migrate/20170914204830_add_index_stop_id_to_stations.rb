class AddIndexStopIdToStations < ActiveRecord::Migration[5.1]
  def change
    add_index :stations, :stop_id
  end
end
