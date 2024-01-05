class Provider < ApplicationRecord
  has_many :availabilities
  has_many :reservations
end
