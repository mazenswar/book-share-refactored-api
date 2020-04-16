class Donation < ApplicationRecord

  belongs_to :user
  belongs_to :book
  has_one :purchase
  validates :condition, presence: true, numericality: {greater_than: 0, less_than: 6}
  validates :user_id, uniqueness: { scope: :book_id }
  def self.credit_worth(num)
    int = num.to_i
    x = 0
    case 
    when int > 3 && int < 6 then x = 3 
    when int == 3 then x = 2
    when int > 0 && int < 3 then x = 1
    end
    x
  end

  def self.do(data, user)
    ## Find or create the book
    book = Book.find_by(gid: data[:gid]) || Book.create(Book.sanitize(data))
    ## If the book has author(s) then create the relationship between an author and a book
    if data[:authors]
      
      data[:authors].each do |a|
        auth = Author.find_or_create_by(name: a)
        BookAuthor.create(book: book, author: auth)
      end
    end
    ## Create ImageLinks
      imgObj = data[:image_link] || {thumb: "", small_thumb: ""}
        ImageLink.create(book: book, thumb: imgObj[:thumb], small_thumb: imgObj[:small_thumb])
      

    ## If the book has genre(s) then create the relationship between a genre and a book
      if data[:categories]
        data[:categories].each do |g|
          genre = Genre.find_or_create_by(name: g)
          if genre 
            BookGenre.create(book: book, genre: genre)
          end
        end
      end
      ## Create ISBN tags
      data[:industry_identifiers].each do |o|
        IdTag.create(book: book, isbn_type: o[:type], isbn_no: o[:identifier])
      end
      ## Create Donation
      donation = Donation.create(
          book: book, 
          user: user, 
          condition: data[:condition],
          credits_received: Donation.credit_worth(data[:condition])
      )
      ## Increase user credits if the donation is successful
      if donation.valid?
        user_credits = user.credits + Donation.credit_worth(data[:condition])
        user.update(credits: user_credits)
      end
      ## return 
      donation
  end


end
