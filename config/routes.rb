Rails.application.routes.draw do

  devise_for :teachers
  get 'welcome/index'

  resources :schedules do
    get :calendar, on: :collection
    get :save_calendar, on: :collection
    post :assign, on: :collection
  end

  root 'welcome#index'

end
