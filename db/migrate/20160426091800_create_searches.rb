class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :make
      t.string :model
      t.decimal :min_price
      t.decimal :max_price
      t.date :min_year
      t.date :max_year
      t.string :transmission
      t.string :bodytype
      t.string :fueltype

      t.timestamps null: false
    end
  end
end
