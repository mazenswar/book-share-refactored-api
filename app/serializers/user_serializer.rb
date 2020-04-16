class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :full_name, :email, :credits, :books_donated, :books_purchased
  # has_many :donated_books
  has_many :donations
  has_many :purchases

  # def purchases
  #   object.purchases.map do |p|
  #     {id: p.id, book: p.book, credits_used: p.credits_used, donated_by: p.donation.user.username}
  #   end
  # end
end
