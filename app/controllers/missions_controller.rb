class MissionsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

  # POST '/missons'
  def create
    mission = Mission.create!(mission_params)
    render json: mission.planet, status: :created
  end

  private

  def mission_params
    params.permit(:name, :scientist_id, :planet_id)
  end

  def render_invalid(invalid)
    render json: { errors: ["validation errors"] }, status: :unprocessable_entity
  end
end
