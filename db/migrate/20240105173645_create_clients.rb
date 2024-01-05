class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :phone_number

      t.timestamps
    end
  end
end
