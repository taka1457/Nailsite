class Public::SearchsController < ApplicationController
  def search
    @content = params["search"]["content"]
    @records = search_for(@content).page(params[:page]).per(20)
    @genres = Genre.where(is_void_flag: true)
  end

  def map_search
    @content = params["search"]["content"]
    @records = search_for(@content).page(params[:page]).per(10)
    @genres = Genre.where(is_void_flag: true)
    gon.shops = @records
  end

  private

  def search_for(content)
    # 文字列の改行が必要
    # Shop.where(is_active: true).
    #  where('(name LIKE ?) OR (prefecture_code LIKE ?) OR (city LIKE ?) OR (street LIKE ?) OR (promotion LIKE ?) OR (introduction LIKE ?)', '%' + content + '%', '%' + content + '%', '%' + content + '%', '%' + content + '%', '%' + content + '%', '%' + content + '%')
    # sanitize導入↓
    Shop.where(is_active: true).
      where("(name LIKE :keyword) OR (prefecture_code LIKE :keyword) OR (city LIKE :keyword) OR (street LIKE :keyword) OR (promotion LIKE :keyword) OR (introduction LIKE :keyword)", keyword:"%#{ActiveRecord::Base::sanitize_sql_like(content)}%")
  end
end
