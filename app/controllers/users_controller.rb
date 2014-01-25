class UsersController < ApplicationController
  
  def index
    @users = User.paginate page: params[:page], order: "created_at DESC"
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.save
      flash[:success] = "New account created successfully"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id] 
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success] = "User infomation successfully updated!"
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find params[:id]
    if @user.admin == 0
      @user.destroy
      flash[:success] = "User deleted"
    else 
      flash[:notice] = "User #{@user.name} is an Administrator"
    end
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation, :email_confirmation)
  end

  def admin_user
    redirect_to root_url unless current_user.admin == 1
  end
  
end
