class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.belongs_to :user, foreign_key: true
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone_number
      t.string :country

      t.timestamps
    end
  end
end
