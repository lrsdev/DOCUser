class AddDogStatusToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :dog_status, :integer
  end
end
