module Smithy
  class UserSessionsController < BaseController
    skip_before_filter :authenticate_smithy_admin, :only => [:new, :create]

    def new
      Smithy.log :debug, "[Auth] Entering UserSessionsController#new"
    end

    def create
      Smithy.log :debug, "[Auth] Entering UserSessionsController#create"
      user = User.find_by_email(filtered_params[:email])
      Smithy.log :debug, "[Auth] user found: #{user.inspect}"
      if user && user.authenticate(filtered_params[:password])
        Smithy.log :debug, "[Auth] User authenticated"
        session[:user_id] = user.id
        Smithy.log :debug, "[Auth] session[:user_id]: #{session[:user_id].inspect}"
        redirect_to pages_path, :notice => "Logged in!"
      else
        flash.now.alert = "Invalid email or password"
        render "new"
      end
    end

    def destroy
      session[:user_id] = nil
      Smithy.log :debug, "[Auth] User signed out"
      Smithy.log :debug, "[Auth] session[:user_id]: #{session[:user_id].inspect}"
      redirect_to root_url, :notice => "Logged out!"
    end
  end

  private
    def filtered_params
      params.fetch(:login, {}).permit( :email, :password )
    end

end
