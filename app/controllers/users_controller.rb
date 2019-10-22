class UsersController < ApplicationController
 
 before_action :check_user, only: [:index]
 before_action :only_see_own_page, only: [:show]
  before_action :only_create_user_when_none_signed_in,only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
    def new
        @user = User.new
    end
    def index
      @users = User.all
    end
    def create
        @user = User.new(user_params) 
        if @user.save
        session[:user_id] = @user.id
        redirect_to tasks_path(@user.id)
          else
            render 'new'
        end
    end
    def only_see_own_page
      @user = User.find(params[:id])
      if current_user != @user
        redirect_to tasks_path, notice: "sorry, you are not allowed to see other user's profile"
      end
    end
        
  def show
    @user = User.find(params[:id])
    #@admin=user.name
  end  
  def edit
    @user= User.find(params[:id])
  end
  def update
    @user= User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = 'user updated!'
      redirect_to root_path
    else
      flash[:error] = 'Failed to edit user!'
      render :edit
    end
  end
  # DELETE method for deleting a product from database based on id
  def destroy
    @user = User.find(params[:id])
    if @user.tasks.present?
      Task.where(user_id: params[:id]).destroy_all
    end
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
  
  # destroy
    #@user = User.find(params[:id])
    #if @user.tasks.present?
      #Task.where(user_id: params[:id]).destroy_all
    #end
    #if @user.delete
     # flash[:notice] = 'user deleted!'
      #redirect_to root_path
    #else
#      render :destroy
    #end
  #end
  
 def current_user
  User.find_by(id: session[:user_id])
 end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :user_type, :user_id)
    end
    def check_user
    if current_user && current_user.user_type != "admin"
     redirect_to root_path, notice: "only admin can access this page"
    end
    end
    def only_create_user_when_none_signed_in
      if current_user
        redirect_to users_path,  notice: "you can't create user when signed in"
      end
    
    end  
    def set_user
      @user = User.find(params[:id])
    end
end
