class AvailabilitiesController < ApplicationController
  # GET /availabilities
  def index
    @availabilities = Availability.all

    render json: @availabilities
  end

  # GET /availabilities/1
  def show
    @availability = Availability.find(params[:id])
    render json: @availability
  end

  # POST /availabilities
  def create
    @availability = Availability.new(availability_params)

    if @availability.save
      render json: @availability, status: :created
    else
      render json: @availability.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /availabilities/1
  def update
    @availability = Availability.find(params[:id])
    if @availability.update(availability_params)
      render json: @availability
    else
      render json: @availability.errors, status: :unprocessable_entity
    end
  end

  # DELETE /availabilities/1
  def destroy
    @availability = Availability.find(params[:id])
    @availability.destroy!
  end

  private

  # Only allow a list of trusted parameters through.
  def availability_params
    params.require(:availability).permit(:provider_id, :start_time, :end_time)
  end
end
