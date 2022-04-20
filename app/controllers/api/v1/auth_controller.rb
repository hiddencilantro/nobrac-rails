class Api::V1::AuthController < ApplicationController
    def create
        if user_login_params[:email].blank?
            render json: { message: "Email can't be blank" }, status: :bad_request
        else
            user = User.find_by(email: user_login_params[:email])
            if user
                if user.authenticate(user_login_params[:password])
                    token = encode_token({user_id: user.id})
                    render json: { user: UserSerializer.new(user), jwt: token }, status: :created
                else
                    render json: { message: 'Password is incorrect' }, status: :unauthorized
                end
            else
                render json: { message: "Email doesn't exist" }, status: :not_found
            end
        end
    end

    private

    def user_login_params
        params.require(:user).permit(:email, :password)
    end
end
