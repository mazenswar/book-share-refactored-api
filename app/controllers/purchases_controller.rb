class PurchasesController < ApplicationController
    def index 
        render json: Purchase.all
    end
    def create 
        donation = Donation.find(params[:id])
        credit_worth = Donation.credit_worth(donation.condition)
        user = active_user
        p = Purchase.create(donation: donation, credits_used: credit_worth, user: user)
        if p.valid?
            new_credits = user.credits - credit_worth
            user.update(credits: new_credits)
            render json: user
        else 
            render json: {errors: p.errors.full_messages}
        end
    end
end
