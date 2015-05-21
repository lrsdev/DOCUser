class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.integer :location_id
      t.integer :animal_id
      t.text :blurb
      t.st_point :geolocation
    end
  end
end
