Rails.application.routes.draw do

  devise_for :teachers

  resources :schedules do
    get :calendar, on: :collection
    get :save_calendar, on: :collection
    post :assign, on: :collection
  end

  root 'schedules#index'

end
