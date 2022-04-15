class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def render_unprocessable_entity_response(exception)
        render json: exception.record.errors.full_messages, status: :unprocessable_entity
    end

    def render_not_found_response(exception)
        render json: { message: exception.message }, status: :not_found
    end

    def encode_token(payload)
        JWT.encode(payload, ENV['JWT_SECRET'])
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, ENV['JWT_SECRET'])
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized?
        unless logged_in?
            binding.remote_pry
            render json: { message: 'Please sign up or log in' }, status: :unauthorized
        end
    end
end
