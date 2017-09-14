class AddLineToStations < ActiveRecord::Migration[5.1]
  def change
    add_column :stations, :line, :string
  end
end
