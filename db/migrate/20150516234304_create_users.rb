class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_names
      t.string :last_name
      t.string :email
      t.string :image_url
      t.string :password
      t.string :api_key

      t.timestamps null: false
    end
  end
end
