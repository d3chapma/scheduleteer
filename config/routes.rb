Rails.application.routes.draw do



  root 'events#index'

  resources :events do
    resources :volunteers
    resources :jobs
    resources :schedules
  end

end
