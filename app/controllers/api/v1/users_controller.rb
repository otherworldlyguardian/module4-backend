class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: {
        username: user.username,
        jwt: issue_token({id: user.id})
      }
    else
      render json: {
        error: 'Incorrect information'
      }, status: 401
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
