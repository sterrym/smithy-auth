Smithy::Engine.routes.prepend do
  get '/login' => 'user_sessions#new', :as => :login
  resource :user_sessions, :only => [:new, :create, :delete]
  scope "/smithy" do
    resources :users
  end
end
