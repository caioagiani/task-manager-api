class Api::V1::UsersController < ApplicationController
  respond_to :json

  def show
    begin
      @user = User.find(params[:id])

      respond_with @user
    rescue
      head 404
    end
  end

  def create
    user =  User.new(user_params)

    if user.save
      render json: user, status: 201
    else
      render json: { errors: user.errors }, status: 422
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
