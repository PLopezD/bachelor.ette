class CreateFutureBachs < ActiveRecord::Migration
  def change
    create_table :future_bachs do |t|
      t.integer  :user_id
      t.string   :status

      t.timestamps
    end
  end
end
