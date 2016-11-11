class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :postal_code
      t.string :country
      t.string :email
      t.string :user_d
      t.string :password

      t.timestamps null: false
    end
  end
end
