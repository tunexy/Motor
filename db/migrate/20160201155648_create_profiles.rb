class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :title
      t.string :firstname
      t.string :lastname
      t.date :dateofbirth
      t.string :martialstatus
      t.string :phonenumber
      t.string :employmentstatus
      t.text :address
      t.string :city
      t.string :country
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
