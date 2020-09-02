Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
  }
  namespace :shop do
    get 'bookmarks/create'
    get 'bookmarks/destroy'
  end
  devise_for :shops, controllers: {
    sessions: 'shop/sessions',
    registrations: 'shop/registrations',
  }
  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
  }
  scope module: :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end

  scope module: :public do
    root 'homes#top'
    get 'about', to: 'homes#about'
    get 'customers/mypage' => 'customers#mypage', as: 'mypage'
    get 'customers/information/edit' => 'customers#edit', as: 'edit_information'
    patch 'customers/information' => 'customers#update', as: 'update_information'
    put 'customers/information' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw_customer'
    put 'customers/withdraw' => 'customers#withdraw'
    get 'reserves/confirm', to: 'reserves#confirm', as: 'reserve_confirm'
    post 'reserves/confirm', to: 'reserves#confirm', as: 'reserves_confirm_post'
    post 'reserves/create', to: 'reserves#create', as: 'reserves_create'
    get 'reserves/done', to: 'reserves#done', as: 'reserves_done'
    get 'customers/:customer_id/talk_rooms/:id' => 'talks#show', as: 'customers_talk'
    get 'customers/talks' => 'talks#index', as: 'customers_talks'
    get 'search', to: 'searchs#search', as: 'search'
    get 'map_search', to: 'searchs#map_search', as: 'map_search'
    get 'customers/follows' => 'relationships#follow', as: 'follow'
    get 'customers/bookmarks' => 'bookmarks#index', as: 'bookmarks'
    get 'customers/reserve' => 'reserves#new', as: 'reserve'

    resources :customers, only: [:index, :show] do
      resources :talks, only: [:create]
      resource :relationships, only: [:create, :destroy]
      resources :reservation_menus, only: [:create]
      resources :reservation_histories, only: [:index] do
        resources :history_comments, only: [:create, :destroy]
      end
    end
    resources :reservation_menus, only: [:index]
  end

  scope module: :shop do
    get 'shops/mypage' => 'shops#mypage', as: 'shop_mypage'
    get 'shops/information/edit' => 'shops#edit', as: 'edit_shop_information'
    patch 'shops/information' => 'shops#update', as: 'update_shop_information'
    put 'shops/information' => 'shops#update'
    get 'shops/unsubscribe' => 'shops#unsubscribe', as: 'confirm_shop_unsubscribe'
    patch 'shops/withdraw' => 'shops#withdraw', as: 'withdraw_shop'
    put 'shops/withdraw' => 'shops#withdraw'
    get 'shops/:id/menulist' => 'shops#menu', as: 'shop_menu_list'
    get 'posts/all' => 'posts#all_index'
    get 'posts/rank' => 'posts#rank'
    get 'shops/:id/postlist' => 'posts#list', as: 'shop_posts_list'
    get 'shops/map' => 'shops#map', as: 'shops_map'
    get 'talk_rooms/:id/:shop_id/:customer_id' => 'talks#show', as: 'shops_talk'
    get 'shops/talks' => 'talks#index', as: 'shops_talks'
    get 'shops/reservation_histories' => 'reservation_histories#index', as: 'shops_histories'
    patch 'shops/reservation_histories/:id' => 'reservation_histories#update', as: 'update_history'
    get '/genres/:genre_id' => 'shops#search', as: 'shops_search'
    get '/mapgenres/:genre_id' => 'shops#map_search', as: 'shops_map_search'
    get 'shops/:id/review' => 'reservation_histories#review', as: 'shop_review'

    resources :shops, only: [:index, :show] do
      resources :menus, except: [:show]
      resource :bookmarks, only: [:create, :destroy]
      resources :talks, only: [:create]
      resources :posts do
        resources :post_comments, only: [:create, :destroy]
        resource :favorites, only: [:create, :destroy]
      end
    end
  end
end
