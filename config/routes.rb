Smithy::Engine.routes.prepend do
  scope '/smithy' do
    match '/login' => 'user_sessions#new', :as => :login
    match '/logout' => 'user_sessions#destroy', :via => :delete, :as => :logout
    resource :user_session, :only => [:new, :create, :destroy]
    resources :users
  end
end
