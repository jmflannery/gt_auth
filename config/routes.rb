GtAuth::Engine.routes.draw do
  resource :session, only: [:create, :destroy]
end
