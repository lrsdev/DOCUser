class AddLatToReport < ActiveRecord::Migration
  def change
    add_column :reports, :lat, :decimal
  end
end
