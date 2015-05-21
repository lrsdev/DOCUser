class ChangeLocationTypeColumn < ActiveRecord::Migration
  def change
    change_column :locations, :location_type, :integer
  end
end
