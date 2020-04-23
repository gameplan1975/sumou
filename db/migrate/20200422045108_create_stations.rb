class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :line_name
      t.string :station_name
      t.integer :walk_time

      t.timestamps
    end
  end
end
