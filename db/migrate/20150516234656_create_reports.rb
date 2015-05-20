class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :location_id
      t.integer :user_id
      t.integer :animal_id
      t.text :blurb
      t.string :image_url

      t.timestamps null: false
    end
  end
end
