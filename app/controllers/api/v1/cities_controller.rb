class Api::V1::CitiesController < ApplicationController
  def index
    @cities = City.all
    render json: {
      cities: @cities
    }, status: 200
  end

  def show
    @city = City.find_by_owm_id(params[:id])
    render json: {
      city: @city
    }, status: 200
  end
end
