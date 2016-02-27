Rails.application.routes.draw do

  devise_for :teachers, controllers: { sessions: "sessions" }

  resources :schedules, only: :index do
    get :calendar, on: :collection
    post :assign, on: :collection
    post :pick_courses, on: :collection
    post :set_courses, on: :member
    get :view, on: :collection
  end

  root 'routes#root'

end
