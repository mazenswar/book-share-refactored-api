class DonationSerializer < ActiveModel::Serializer
  attributes :id, :credits_received, :condition, :ddate, :worth, :user_id, :by

  belongs_to :book

  


    #  t.string :title xxxx

    #   t.integer :page_count
    #   t.integer :average_rating
    #   t.string :language
    #   t.string :preview_link
    #   t.string :info_link
    #   t.string :description
    #   t.string :gid
    #   t.string :publisher
    #   t.string :pdate

  def by
    object.user.username
  end



  def worth
    num = object.condition
    int = num.to_i
    x = 0
    case 
    when int > 3 && int < 6 then x = 3 
    when int == 3 then x = 2
    when int > 0 && int < 3 then x = 1
    end
    x
  end

  def ddate
    object.created_at
  end

end
