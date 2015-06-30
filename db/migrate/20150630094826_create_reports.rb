class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :location, index: true, foreign_key: true
      t.text :blurb
      t.st_point :geolocation, geographic: true
      t.timestamps null: false
    end
  end
end
