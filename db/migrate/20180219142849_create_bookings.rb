class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.date :checkin
      t.date :checkout
      t.string :status

      t.timestamps
    end
  end
end
