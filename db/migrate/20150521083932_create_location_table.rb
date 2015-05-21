class CreateLocationTable < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :location_type
      t.string :name
      t.text :blurb
      t.text :dog_guidelines
      t.integer :dog_status
      t.multi_point :geo_access_points
      t.st_polygon :geo_fence
    end
  end
end
