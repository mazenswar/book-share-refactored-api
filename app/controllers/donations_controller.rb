class DonationsController < ApplicationController
    def index 
        render json: Donation.all
    end
    def create
        donation = Donation.do(donation_params, active_user)
        if donation.valid?
            render json: donation.user
        else
            render json: {errors: donation.errors.full_messages}
        end
    end

    private

    def donation_params
        params.permit(
            :gid, 
            :title, 
            :description,
            :page_count,
            :average_rating,
            :preview_link,
            :info_link,
            :language,
            :condition,
            :publisher,
            :pdate,
            authors: [],
            categories: [],
            industry_identifiers: [:type, :identifier],
            image_link: {})
    end
end
