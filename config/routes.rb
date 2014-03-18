Smithy::Engine.routes.prepend do
  scope '/smithy' do
    get '/login' => 'user_sessions#new', :as => :login unless has_named_route?(:login)
    delete '/logout' => 'user_sessions#destroy', :as => :logout unless has_named_route?(:logout)
    resource :user_session, :only => [:new, :create, :destroy]
    resources :users
  end
end
