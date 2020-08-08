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
  end

end
