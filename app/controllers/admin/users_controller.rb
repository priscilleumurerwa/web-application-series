class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
   before_action :check_user, only: [:index]
    def index
   @users = User.all
    end
    def show
      @user = current_user
    redirect_to root_path, warning: "You are not authorized" unless @user.admin?
    end
    def destroy
      if @user.id == current_user.id
        redirect_to admin_users_url, notice: "You can not delete signed in user"
        @admin = User.admin
      elsif @admin == 1
        redirect_to admin_users_url, notice: "Atleast one admin must remain!"
      else
        @user.destroy
        redirect_to admin_users_url, notice: 'User was successfully destroyed.'
      end
    end
    def set_user
      @user = User.find(params[:id])
    end
  
    
end
 def check_user
    if current_user && current_user.user_type != "admin"
      redirect_to root_path, notice: "only admin can access this page"
   end
   end