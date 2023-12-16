Rails.application.routes.draw do
  resources :games do
    member do
      patch 'update_game', to: 'games#update_game'
      delete 'delete_game', to: 'games#delete_game'#routes for delete
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end