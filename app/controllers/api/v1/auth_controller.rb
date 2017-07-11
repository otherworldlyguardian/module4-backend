module Api
  module V1
    class AuthController < ApplicationController

      def show
        render json: {
          id: current_user.id,
          username: current_user.username
        }
      end

      def create
        user = User.find_by(username: params[:username])
        if user.present? && user.authenticate(params[:password])
          render json: {
            username: user.username,
            jwt: issue_token ({id: user.id})
          }
        else

        end
      end

    end
  end
end
