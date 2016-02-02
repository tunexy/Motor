class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :rating
      t.text :message
      t.boolean :offer
      t.integer :user_id
      t.integer :advert_id

      t.timestamps null: false
    end
  end
end
