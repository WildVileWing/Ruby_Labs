class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  #Read GET/users
  def index
    @users = User.all
  end

  #Show GET/users/333
  def show
  end

  #New GET/users/new
  def new
    @user = User.new
  end

  #Edit GET/users/333/edit
  def edit
  end

  #Create POST/users
  def create
    @user = User.new(user_attributes)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: "User was created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  #Update PATCH/PUT/users/333
  def update
    respond_to do |format|
      if @user.update(user_attributes)
        format.html { redirect_to users_path, notice: "User was updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  #Destroy DELETE/users/333
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was  destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_attributes
    params.require(:user).permit(:email, :first_name, :last_name)
  end
end
