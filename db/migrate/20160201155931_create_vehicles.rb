class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.text :description
      t.string :make
      t.string :model
      t.date :year
      t.decimal :enginesize
      t.integer :cupiccapacity
      t.decimal :price
      t.string :bodytype
      t.string :fueltype
      t.integer :milleage
      t.string :transmission
      t.date :taxdue
      t.date :nctdue
      t.string :platenumber
      t.integer :user_id

      t.timestamps null: false
    end
  end

  
end
