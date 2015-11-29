class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.decimal :lat
      t.decimal :long
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip
      t.string :phone
      t.integer :byob
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
