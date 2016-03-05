class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.references :vehicle, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
