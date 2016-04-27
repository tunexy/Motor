class CreateInsuranceDetails < ActiveRecord::Migration
  def change
    create_table :insurance_details do |t|
      t.string :licensenumber
      t.integer :licenseheld
      t.integer :penaltypoint
      t.date :dateofpenalty
      t.integer :freeclaim
      t.boolean :recentclaim
      t.date :claimdate
      t.integer :yearsdriving
      t.string :packing
      t.boolean :homeowner
      t.integer :kmperyear
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
