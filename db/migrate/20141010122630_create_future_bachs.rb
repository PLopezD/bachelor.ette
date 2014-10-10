class CreateFutureBachs < ActiveRecord::Migration
  def change
    create_table :hookups do |t|
      t.references  :sender
      t.references  :recipient

      t.timestamps
    end
  end
end
