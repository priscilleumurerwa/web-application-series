class Admin::UsersController < ApplicationController
  # before_action :check_user, only: [:index]
    def index
   @users = User.all
    end
end
# def check_user
  #   if current_user && current_user.user_type != "admin"
  #     redirect_to root_path, notice: "only admin can access this page"
  #   end
  # end