class CreateAvailabilities < ActiveRecord::Migration[7.1]
  def change
    create_table :availabilities do |t|
      t.references :provider, null: false, foreign_key: true, index: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
