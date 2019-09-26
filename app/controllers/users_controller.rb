class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def index
      @users = User.all
    end
    def create
        @user = User.new(user_params) 
        if @user.save
         redirect_to user_path(@user.id)
          else
            render 'new'
        end
    end
        
  def show
    @user = User.find(params[:id])
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
    if @user.delete
      flash[:notice] = 'user deleted!'
      redirect_to root_path
    else
      flash[:error] = 'Failed to delete this user!'
      render :destroy
    end
  end
  # we used strong parameters for the validation of params
  # def user_params
  #   params.require(:product).permit(:name, :email :password, :password_confirmation, :title)
  # end
 # end
 def current_user
  User.find_by(id: session[:user_id])
 endsss
  end
    private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
    end
end
