class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :show]
  before_filter :correct_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @properties = @user.properties
  end

  def create
    @user = User.new(params[:user])
    if @user.save
	sign_in @user
	flash[:Success] = "Welcome to Propertygate"
	redirect_to @user
    else
	render 'new'
    end
  end

  def edit
   # @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(params[:user])
	flash[:success] = 'Profile updated'
	sign_in @user
	redirect_to @user
    else
	render 'edit'
    end
  end

  private

  def correct_user
	@user = User.find(params[:id])
	redirect_to(root_path) unless current_user?(@user)
  end
end
