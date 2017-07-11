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

      end

    end
  end
end
