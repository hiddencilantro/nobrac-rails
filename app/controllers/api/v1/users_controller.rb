class Api::V1::UsersController < ApplicationController
    before_action :authorized?, only: [:show]

    def create
        user = User.create!(user_params)
        token = encode_token({user_id: user.id})
        render json: { user: UserSerializer.new(user), jwt: token }, status: :created
    end

    def show
        render json: { footprints: ActiveModel::Serializer::CollectionSerializer.new(current_user.footprints, serializer: FootprintSerializer) }, status: :accepted
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :first_name, :last_name)
    end
end
