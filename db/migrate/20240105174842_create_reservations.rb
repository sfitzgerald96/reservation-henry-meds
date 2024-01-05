class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.references :client, null: false, foreign_key: true
      t.references :provider, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :confirmed_at

      t.timestamps
    end
  end
end
