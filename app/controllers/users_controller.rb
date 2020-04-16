class UsersController < ApplicationController

    def index
      render json: User.all
    end

    def show
      user =  User.find(params[:id])
      render json: user
  
    end

    def create
      user = User.create(user_params)
      if user.valid?
       render json: { user: user, token: encode_token(user) }, status: :created
     else
       render json: { error: 'failed to create user' }, status: :not_acceptable
     end
    end

    private

    def user_params
      params.permit(:username, :password, :email, :full_name)
    end
end
