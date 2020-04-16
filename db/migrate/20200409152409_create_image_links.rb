class CreateImageLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :image_links do |t|
      t.belongs_to :book, foreign_key: true
      t.string :small_thumb
      t.string :thumb
      t.string :misc

      t.timestamps
    end
  end
end
