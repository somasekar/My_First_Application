class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :user_name
      t.string :password
      t.string :encrypt_password
      t.text :present_add
      t.text :permanent_add
      t.datetime :date_of_birth
      t.string :marital_status
      t.integer :mobile_number

      t.timestamps
    end
  
    end

  def self.down
    drop_table :users
  end
end
