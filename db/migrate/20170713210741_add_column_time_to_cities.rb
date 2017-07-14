class AddColumnTimeToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :time, :string
  end
end
