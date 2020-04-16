class CreateIdTags < ActiveRecord::Migration[5.2]
  def change
    create_table :id_tags do |t|
      t.belongs_to :book, foreign_key: true
      t.string :isbn_type
      t.string :isbn_no

      t.timestamps
    end
  end
end
