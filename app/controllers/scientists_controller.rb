class ScientistsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

  # GET '/scientists'
  def index
    render json: Scientist.all, status: :ok
  end

  # GET '/scientists/:id'
  def show
    render json: find_scientist, status: :ok
  end

  # POST '/scientists'
  def create
    scientist = Scientist.create!(scientist_params)
    render json: scientist, status: :created
  end

  # PATCH '/scientists/:id'
  def update
    scientist = find_scientist.update!(scientist_params)
    render json: find_scientist, status: :accepted
  end

  # DELETE '/scientists/:id'
  def destroy
    find_scientist.destroy
    head :no_content
  end

  private

  def find_scientist
    Scientist.find(params[:id])
  end

  def scientist_params
    params.permit(:name, :field_of_study, :avatar)
  end

  def render_not_found(error)
    render json: { error: "Scientist not found" }, status: :not_found
  end

  def render_invalid(invalid)
    render json: { errors: ["validation errors"] }, status: :unprocessable_entity
  end
end
