class AddImageColumnsToLocations < ActiveRecord::Migration
  def self.up
    add_attachment :locations, :image
  end

  def self.dowm
    remove_attachment :locations, :image
  end
end
