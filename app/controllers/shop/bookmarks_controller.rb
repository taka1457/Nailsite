class Shop::BookmarksController < ApplicationController
  before_action :authenticate_customer!

  def create
    @shop = Shop.find(params[:shop_id])
    @shops = Shop.page(params[:page]).per(20)
    bookmark = @shop.bookmarks.new(customer_id: current_customer.id)
    bookmark.save
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @shops = Shop.page(params[:page]).per(20)
    bookmark = @shop.bookmarks.find_by(customer_id: current_customer.id)
    bookmark.destroy
  end
end
