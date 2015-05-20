class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :location_type
      t.string :name

      t.timestamps null: false
    end
  end
end
