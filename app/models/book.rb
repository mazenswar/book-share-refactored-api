class Book < ApplicationRecord
    has_many :donations
    has_one :image_link
    has_many :users, through: :donations

    def self.sanitize(data)
        return {   
            title: data[:title],
            page_count: data[:page_count],
            average_rating: data[:average_rating],
            language: data[:language],
            info_link: data[:info_link],
            description: data[:description],
            publisher: data[:publisher],
            pdate: data[:pdate],
            gid: data[:gid]
        }
    end

    def self.available
        Donation.all.select do |donation|
            Purchase.all.none? { |p| p.donation_id === donation.id } 
        end
    end
end
