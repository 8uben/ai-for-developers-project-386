class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    enable_extension "pgcrypto" unless extension_enabled?("pgcrypto")

    create_table :bookings, id: :uuid do |t|
      t.string :event_type_id, null: false
      t.datetime :start, null: false
      t.datetime :end, null: false
      t.string :guest_name, null: false
      t.string :guest_email, null: false

      t.timestamps
    end

    add_index :bookings, :start
    add_index :bookings, :event_type_id
  end
end
