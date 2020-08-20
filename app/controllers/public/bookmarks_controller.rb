class Public::BookmarksController < ApplicationController
	before_action :authenticate_customer!

  def index
  	@bookmarks = Bookmark.where(customer_id: current_customer.id).reverse_order
  end
end