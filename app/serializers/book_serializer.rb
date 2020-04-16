class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :page_count, :average_rating, :language, :preview_link, :info_link, :description, :gid, :publisher, :pdate,
  :image_link

end
