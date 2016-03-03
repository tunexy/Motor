class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string  
    add_column :users, :firstname, :string   
    add_column :users, :lastname, :string 
    add_column :users, :dateofbirth, :date
    add_column :users, :is_female, :boolean, default: false
    add_column :users, :martialstatus, :string    
    add_column :users, :phonenumber, :string    
    add_column :users, :employmentstatus, :string    
    add_column :users, :address, :text    
    add_column :users, :city, :string    

  end
end
