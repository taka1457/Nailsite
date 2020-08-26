class Public::SearchsController < ApplicationController
  def search
    @content = params["search"]["content"]
    @records = search_for(@content).page(params[:page]).per(20)
    @genres = Genre.where(is_void_flag: true)
  end

  private

  def search_for(content)
    Shop.where('(name LIKE ?) OR (prefecture_code LIKE ?) OR (city LIKE ?) OR (street LIKE ?) OR (promotion LIKE ?) OR (introduction LIKE ?)', '%' + content + '%', '%' + content + '%', '%' + content + '%', '%' + content + '%', '%' + content + '%', '%' + content + '%')
  end
end
