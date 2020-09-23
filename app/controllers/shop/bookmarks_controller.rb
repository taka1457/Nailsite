class Shop::BookmarksController < ApplicationController
  before_action :authenticate_customer!

  def create
    @shop = Shop.find(params[:shop_id])
    @shops = Shop.page(params[:page]).per(20)
    @genres = Genre.page(params[:page]).per(20)
    bookmark = @shop.bookmarks.new(customer_id: current_customer.id)
    if bookmark.save
    else
      redirect_to request.referer
    end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @shops = Shop.page(params[:page]).per(20)
    @genres = Genre.page(params[:page]).per(20)
    bookmark = @shop.bookmarks.find_by(customer_id: current_customer.id)
    if bookmark.destroy
    else
      redirect_to request.referer
    end
  end
end
