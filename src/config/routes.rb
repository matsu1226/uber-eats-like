Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do  # app/controllers/api/v1/ ディレクトリの指定
      resources :restaurants do
        resources :foods, only: [:index]
      end
      resources :line_foods, only: [:index, :create]
      put 'line_foods/replace', to: 'line_foods#replace'
      resources :orders, only: [:create]
    end
  end
end

# resources: restaurants
# GET     /api/vi/restaurants                index   レストランの一覧 api_v1_restaurants_path
# POST    /api/vi/restaurants                create  レストランの作成 api_v1_restaurants_path
# GET     /api/vi/restaurants/:restaurant_id show    レストランの詳細 api_v1_restaurant_path
# POST    /api/vi/restaurants/:restaurant_id update  レストランの更新 api_v1_restaurant_path
# DELETE  /api/vi/restaurants/:restaurant_id destroy レストランの削除 api_v1_restaurant_path

# resources: foods
# GET     /api/vi/restaurants/:restaurant_id/foods  index 商品の一覧

# resources: line_foods
# GET     /api/vi/line_foods                index   レストランの一覧  api_v1_line_foods_path
# POST    /api/vi/line_foods                create  レストランの作成  api_v1_line_foods_path
# PUT     /api/v1/line_foods/replace        replace 

# resources: orders
# POST    /api/v1/orders                    create  オーダーの作成

