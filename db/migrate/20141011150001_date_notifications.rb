class DateNotifications < ActiveRecord::Migration
  def change
    create_table :date_notifications do |t|
      t.string :status
      t.references :user
      t.timestamps
    end
  end
end
