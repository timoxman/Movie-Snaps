class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.string :film
      t.float :latitude
      t.float :longitude
      t.string :address

      t.timestamps null: false
    end
  end
end
