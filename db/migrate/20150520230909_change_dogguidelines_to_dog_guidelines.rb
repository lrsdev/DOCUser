class ChangeDogguidelinesToDogGuidelines < ActiveRecord::Migration
  def change
    rename_column :locations, :dogguidelines, :dog_guide_lines
  end
end
