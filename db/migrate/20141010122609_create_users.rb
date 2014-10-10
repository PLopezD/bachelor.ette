class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :email
      t.string  :password_digest
      t.date    :birthday
      t.string  :picture
      t.text :quirk
      t.string  :gender
      t.text  :bio
      t.string  :preference
      t.integer  :date_count

      t.timestamps
    end
  end
end
