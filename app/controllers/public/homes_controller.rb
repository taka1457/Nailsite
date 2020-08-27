class Public::HomesController < ApplicationController

  def top
    @customers = Customer.all
    @genres = Genre.where(is_void_flag: true)
    @posts = Post.all
  end

  def about
  end
end
