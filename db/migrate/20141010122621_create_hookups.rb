class CreateHookups < ActiveRecord::Migration
  def change
    create_table :hookups do |t|
      t.integer  :sender_id
      t.integer  :recipient_id
      t.text     :description

      t.timestamps
    end
  end
end
