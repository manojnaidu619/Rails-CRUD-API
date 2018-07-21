class Api::V1::UsersController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @user = User.all
     render json: {message: "Displaying all the users", status: "SUCCESS", data: @user}, status: 200
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: 200
  end

  def create
    @user = User.create(user_params)
     if @user.save
       render json: {status: "SUCCESS", message: "Loaded User", data: @user}
     else
       render json: @user.errors, status: 422
     end
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
       render json: @user, status: 200
     else
       render json: {error: @user.errors}
     end
  end

  def destroy
    @user = User.find(params[:id])
     @user.destroy
      head 204
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
