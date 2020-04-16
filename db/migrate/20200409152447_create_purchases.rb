class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :donation, foreign_key: true
      t.integer :credits_used

      t.timestamps
    end
  end
end
