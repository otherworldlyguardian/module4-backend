class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :owm_id
      t.float :lat
      t.float :lon
      t.float :temp
      t.float :wind_speed
      t.float :wind_deg
      t.string :weather
      t.string :weather_description
      t.string :weather_icon

      t.timestamps
    end
  end
end
