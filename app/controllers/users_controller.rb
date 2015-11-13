class UsersController < ApplicationController
  before_action :require_user, only: [:destroy]
  before_action :require_no_user, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    @rants = Rant.all
  end

  def new
    @user =User.new
  end

  def update
    redirect_to users_path
  end


  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thank you for signing up!"
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated!'
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @rants= Rant.all
    @users = User.all
  end

  def destroy
    @user.destroy
      redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:username, :email, :password, :name, :password_confirmation)
  end

end
