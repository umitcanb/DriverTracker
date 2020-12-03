Rails.application.routes.draw do
  devise_for :drivers, path: 'driver'
  resources :drivers
  get '/drivers/:id/checkin', to: 'drivers#checkin' , as: :checkin
  post '/drivers/:id/save_checkin', to: 'drivers#save_checkin' , as: :save_checkin
  get '/drivers/:id/worked_hours', to: 'drivers#see_worked_hours' , as: :see_worked_hours

  root to: 'drivers#index'

  #resources :drivers do
  #  resources :check_ins
  #end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
