class Api::V1::UsersController < ApplicationController
    def create
        user = User.create!(user_params)
        render json: { user: UserSerializer.new(user) }, status: :created
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
