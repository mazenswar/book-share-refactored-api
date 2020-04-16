class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true
    has_many :addresses
    has_many :donations
    has_many :donated_books, through: :donations, source: 'book'
    has_many :purchases
    

    def books_donated
        self.donated_books.length
    end

    def books_purchased
        p = Purchase.all.select {|p| p.user_id === self.id}
        p.length
    end
end
