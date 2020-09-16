class Public::ImgSearchsController < ApplicationController
  before_action :authenticate_customer!

  def new
    @img_search = ImgSearch.new
    @img_searchs = ImgSearch.where(customer_id: current_customer).reverse_order
    @tag = Tag.new
  end

  def create
    @img_search = ImgSearch.new(img_search_params)
    @img_search.customer_id = current_customer.id
    if @img_search.save
      search_tags = Vision.get_image_data(@img_search.search_image)
      search_tags.each do |tag|
        @img_search.search_tags.create(name: tag)
      end
      redirect_to request.referer
    else
      render :new
    end
  end

  def search
    if params[:tag].present?
      @records = Tag.where(name: params[:tag][:name])
    elsif params["img_search"].present?
      @content1 = params["img_search"]["1content"]
      @content2 = params["img_search"]["2content"]
      @content3 = params["img_search"]["3content"]
      @records = search_for(@content1, @content2, @content3).select(:post_id).distinct
    else
      @img_search = ImgSearch.new
      @img_searchs = ImgSearch.where(customer_id: current_customer).reverse_order
      @tag = Tag.new
      render :new
    end
  end

  private

  def img_search_params
    params.require(:img_search).permit(:search_image)
  end

  def search_for(content1, content2, content3)
    # リファクタメモ
    # params{ tags => ["tag1", "tag2", "tag3"] }
    # params["img_search"]["tgs"] => ["tag1", "tag2", "tag3"] この形で params を取得できるのが望ましい
    # search_for(tags) content1,2,3 で渡すのではなく, 検索したい tag を配列で渡したい

    Tag.where('(name LIKE ?) OR (name LIKE ?) OR (name LIKE ?)', "%#{content1}%", "%#{content2}%", "%#{content3}%")

    # AND検索同じ画像でも引っかからないため使用できず
    # Tag.where(['name LIKE ?', "%#{content1}%"]).where(['name LIKE ?', "%#{content2}%"]).where(['name LIKE ?', "%#{content3}%"])
  end
end
