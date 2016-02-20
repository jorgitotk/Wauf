Rails.application.routes.draw do

  devise_for :teachers

  resources :schedules do
    get :calendar, on: :collection
    get :save_calendar, on: :collection
    post :assign, on: :collection
    post :pick_courses, on: :collection
    post :set_courses, on: :member
  end

  root 'schedules#index'

end
