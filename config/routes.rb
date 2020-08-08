Rails.application.routes.draw do
  devise_for :shops
  devise_for :customers
  
  scope module: :public do
  	root 'homes#top'
  	get 'about', to: 'homes#about'
  end
end
