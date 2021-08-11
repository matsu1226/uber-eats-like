module Api
  module V1
    class RestaurantsController < ApplicationController
      def index
        restaurants = Restaurant.all
        render json: {
          restaurants: restaurants
        }, status: :ok    
        # response code "200 OK" ならデータを返す
      end
    end
  end
end