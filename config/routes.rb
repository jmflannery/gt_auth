GtAuth::Engine.routes.draw do
  resources :administrators, only: [:create, :update, :index, :show, :destroy]
  resource :session, only: [:create, :destroy]
end
