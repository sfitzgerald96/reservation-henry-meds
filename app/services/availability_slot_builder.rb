class AvailabilitySlotBuilder
  def initialize(availabilities, reservations)
    @availabilities = availabilities
    @reservations = reservations
  end

  def build_slots
    slots = []

    @availabilities.each do |availability|
      slots.concat(build_slots_for_availability(availability))
    end

    slots.reject { |slot| slot_has_reservation?(slot) }
  end

  private

  def slot_has_reservation?(slot)
    @reservations.any? do |reservation|
      reservation_start = reservation.start_time
      reservation_end = reservation.end_time

      # Check if the slot overlaps with the reservation
      (slot[:start_time] < reservation_end) && (slot[:end_time] > reservation_start)
    end
  end

  def build_slots_for_availability(availability)
    start_time = availability.start_time
    end_time = availability.end_time
    slot_duration = 15.minutes

    current_time = start_time
    slots = []

    while current_time < end_time
      slots << { start_time: current_time, end_time: current_time + slot_duration }
      current_time += slot_duration
    end

    slots
  end
end
