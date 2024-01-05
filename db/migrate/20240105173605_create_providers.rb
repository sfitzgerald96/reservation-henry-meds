class CreateProviders < ActiveRecord::Migration[7.1]
  def change
    create_table :providers do |t|
      t.string :first_name
      t.string :last_name
      t.string :office_address
      t.string :phone_number

      t.timestamps
    end
  end
end
