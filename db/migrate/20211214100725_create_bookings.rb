class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :car, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :start_at
      t.date :end_at
      t.integer :total_price

      t.timestamps
    end
  end
end
