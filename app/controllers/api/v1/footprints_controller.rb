class Api::V1::FootprintsController < ApplicationController
    before_action :authorized?

    def create
        footprint = Footprint.new(footprint_params)
        footprint.user_id = current_user.id
        footprint.save!
        render json: { footprint: FootprintSerializer.new(footprint) }, status: :created
    end

    private

    def footprint_params
        params.require(:footprint).permit(:total, :vehicle, :publictransit, :flight, :electricity, :naturalgas, :water, :food, :beverages, :dining, :tobacco, :goods, :services, :recreation)
    end
end
