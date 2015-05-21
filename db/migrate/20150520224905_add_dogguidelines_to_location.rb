class AddDogguidelinesToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :dogguidelines, :text
  end
end
