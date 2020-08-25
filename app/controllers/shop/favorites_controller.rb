class Shop::FavoritesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @post = Post.find(params[:post_id])
    @shop = @post.shop.id
    favorite = @post.favorites.new(customer_id: current_customer.id)
    favorite.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @shop = @post.shop.id
    favorite = @post.favorites.find_by(customer_id: current_customer.id)
    favorite.destroy
  end
end
