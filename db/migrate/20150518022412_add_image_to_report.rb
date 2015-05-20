class AddImageToReport < ActiveRecord::Migration
  def self.up
    add_attachment :reports, :image
  end

  def self.down
    add_attachment :reports, :image
  end
end
