Rails.application.routes.draw do
  put 'reservations/:id/confirm', to: 'reservations#confirm'
  patch 'reservations/:id/confirm', to: 'reservations#confirm'
  post 'reservations', to: 'reservations#create'

  get 'availabilities/possible_timeslots', to: 'availabilities#possible_timeslots'
  post 'availabilities', to: 'availabilities#create'

  get "up" => "rails/health#show", as: :rails_health_check
end
