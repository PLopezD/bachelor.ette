class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :email
      t.string  :password_hash
      t.date    :birthday
      t.string  :picture
      t.string  :quirk
      t.string  :gender
      t.string  :bio
      t.string  :preference
      t.integer  :date_count
      
      t.timestamps
    end
  end
end
