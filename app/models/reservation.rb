class Reservation < ApplicationRecord
  # Associations
  belongs_to :client
  belongs_to :provider

  # Validations
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :validate_confirmed_at_within_30_minutes
  validate :validate_15_minute_slot
  validate :validate_reservation_is_not_expired
  validate :validate_start_time_at_least_24_hours_from_now, on: :create

  def expired?
    puts confirmed_at
    puts created_at
    # confirmed_at.nil? && created_at < 30.minutes.ago
  end

  private

  def validate_15_minute_slot
    unless start_time.nil? || end_time.nil?
      unless ((end_time - start_time) % 15.minutes).zero?
        errors.add(:base, 'Start time and end time must be a 15-minute slot')
      end
    end
  end

  def validate_reservation_is_not_expired
    if expired?
      errors.add(:base, 'This reservation has expired. Each reservation is only held for 30 minutes unless confirmed.')
    end
  end

  def validate_confirmed_at_within_30_minutes
    if confirmed_at.present? && (confirmed_at - created_at > 30.minutes)
      errors.add(:base, 'Confirmed time should not be greater than 30 minutes from created time')
    end
  end

  def validate_start_time_at_least_24_hours_from_now
    if start_time.present? && start_time < 24.hours.from_now
      errors.add(:base, 'Start time should be at least 24 hours from now')
    end
  end
end
