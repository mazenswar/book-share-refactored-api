class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :page_count
      t.integer :average_rating
      t.string :language
      t.string :preview_link
      t.string :info_link
      t.string :description
      t.string :gid
      t.string :publisher
      t.string :pdate
      t.timestamps
    end
  end
end

   