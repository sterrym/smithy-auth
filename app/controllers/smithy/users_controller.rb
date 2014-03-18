module Smithy
  class UsersController < BaseController

    before_filter :load_users
    respond_to :html, :json

    def index
      respond_with @users
    end

    def new
      @user = User.new(filtered_params)
      respond_with @user
    end

    def create
      @user = User.new(filtered_params)
      @user.save
      flash.notice = "The user was created" if @user.persisted?
      respond_with @user do |format|
        format.html { redirect_to [:edit, @user] }
      end
    end

    def edit
      @user = User.find(params[:id])
      respond_with @user
    end

    def update
      @user = User.find(params[:id])
      flash.notice = "The user was saved" if @user.update_attributes(filtered_params)
      respond_with @user do |format|
        format.html { redirect_to [:edit, @user] }
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      respond_with @user
    end

    private
      def filtered_params
        params.fetch(:user, {}).permit( :email, :password, :password_confirmation )
      end

      def load_users
        @users = User.order(:email)
      end

  end
end
