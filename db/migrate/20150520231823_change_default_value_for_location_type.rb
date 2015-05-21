class ChangeDefaultValueForLocationType < ActiveRecord::Migration
  def change
    change_column :locations, :location_type, :integer, :default => 1
    change_column :locations, :dog_status, :integer, :default => 1
  end
end
