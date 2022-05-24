Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[create index show update destroy]
      resources :parcels, only: %i[create index show update destroy]
      resources :trains, only: %i[create index show update destroy]
      resources :train_bids, only: %i[create index show update destroy]
      resources :train_parcels, only: %i[create index show update destroy]
      resources :train_lines, only: %i[create index show update destroy]
      resources :trains, only: %i[create index show update destroy]
      resources :lines, only: %i[create index show update destroy]
    end
  end
end
