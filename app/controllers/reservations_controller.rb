class ReservationsController < ApplicationController
  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)
    # TODO: Finish create logic so you can only create a reservation if the timeslot is available

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservations/1/confirm
  def confirm
    @reservation = Reservation.find(params[:id])
    if @reservation.update({ confirmed_at: DateTime.now })
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:client_id, :provider_id, :start_time, :end_time, :confirmed_at)
  end
end
