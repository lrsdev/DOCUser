class AddLongToReport < ActiveRecord::Migration
  def change
    add_column :reports, :long, :decimal
  end
end
