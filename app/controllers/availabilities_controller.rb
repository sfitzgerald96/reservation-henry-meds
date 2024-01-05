class AvailabilitiesController < ApplicationController
  # GET /availabilities/available
  def possible_timeslots
    @availabilities = Availability.where('end_time > ?', 24.hours.from_now)
    @reservations = Reservation.where('end_time > ?', 24.hours.from_now)
    slot_builder = AvailabilitySlotBuilder.new(@availabilities, @reservations)

    @availability_slots = slot_builder.build_slots

    render json: @availability_slots
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

  private

  # Only allow a list of trusted parameters through.
  def availability_params
    params.require(:availability).permit(:provider_id, :start_time, :end_time)
  end
end
