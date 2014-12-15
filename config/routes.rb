Rails.application.routes.draw do



  root 'events#index'

  resources :events do
    resources :volunteers
    resources :jobs
    resources :schedules
  end

  resources :assignments, only: [] do
    member do
      put :toggle_absent
      put :toggle_confirmed
    end
  end

end
