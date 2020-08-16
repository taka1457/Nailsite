Rails.application.routes.draw do

  devise_for :shops, controllers: {
    sessions: 'shop/sessions',
    registrations: 'shop/registrations',
  }
  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
  }

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
    get 'talk/:id' => 'talks#show', as: 'talk'
    get 'customers/talks' => 'talks#index', as: 'customers_talks'

    resources :customers, only: [:index, :show] do
      resources :reservation_menus, only: [:create]
      resources :reserves, only: [:new, :index, :show]
      resources :reservation_histories, only: [:index] do
        resources :history_comments, only: [:create, :destroy]
      end
    end
    resources :reservation_menus, only: [:index]
    resources :talks, only: [:create]
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
    get 'shops/:id/postlist' => 'posts#list', as: 'shop_posts_list'

    resources :shops, only: [:index, :show] do
      resources :menus, except: [:show]
      resources :posts do
        resources :post_comments, only: [:create, :destroy]
      end
    end
  end

end
