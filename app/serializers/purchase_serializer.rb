class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :user_id,:purchased_on
  has_one :book
  
  def purchased_on
    object.created_at
  end
end
