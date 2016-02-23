class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :rating
      t.text :message
      t.boolean :offer
      t.integer :user_id
      t.integer :vehicle_id

      t.timestamps null: false
    end
  end
end
