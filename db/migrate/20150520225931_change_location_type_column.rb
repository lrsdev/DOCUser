class ChangeLocationTypeColumn < ActiveRecord::Migration
  def change
    change_column :locations, :location_type, :integer
    change_column :locations, :location_type, 'integer USING CAST("location_type" AS integer)'
  end
end
