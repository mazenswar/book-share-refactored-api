class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :donation
  has_one :book, through: :donation
end
