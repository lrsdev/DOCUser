class AddBlurbToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :blurb, :text
  end
end
