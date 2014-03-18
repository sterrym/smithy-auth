Smithy::Engine.routes.prepend do
  scope '/smithy' do
    get '/login' => 'user_sessions#new', :as => :login
    delete '/logout' => 'user_sessions#destroy', :as => :logout
    resource :user_session, :only => [:new, :create, :destroy]
    resources :users
  end
end
