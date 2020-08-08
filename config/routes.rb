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
    get 'customers/mypage' => 'customers#show', as: 'mypage'
    get 'customers/information/edit' => 'customers#edit', as: 'edit_information'
    patch 'customers/information' => 'customers#update', as: 'update_information'
    put 'customers/information' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw_customer'
    put 'customers/withdraw' => 'customers#withdraw'
  end

  scope module: :shop do
    get 'shops/mypage' => 'shops#show', as: 'shop_mypage'
    get 'shops/information/edit' => 'shops#edit', as: 'edit_shop_information'
    patch 'shops/information' => 'shops#update', as: 'update_shop_information'
    put 'shops/information' => 'shops#update'
    get 'shops/unsubscribe' => 'shops#unsubscribe', as: 'confirm_shop_unsubscribe'
    patch 'shops/withdraw' => 'shops#withdraw', as: 'withdraw_shop'
    put 'shops/withdraw' => 'shops#withdraw'
  end

end
