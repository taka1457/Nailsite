require 'rails_helper'

RSpec.describe "Shop_posts", type: :request do
  let(:shop) { create(:shop) }
  let(:post) { create(:post) }
  describe '店舗ログイン済み' do
    before do
      sign_in shop
    end
    context "投稿一覧ページが正しく表示される" do
      before do
        get shop_posts_path(shop)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("＋")
      end
    end
    context "メニュ一登録ページが正しく表示される" do
      before do
        get new_shop_post_path(shop)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("新規投稿")
      end
    end
  end
  describe '店舗非ログイン' do
    context "最新投稿ページが正しく表示される" do
      before do
        get posts_all_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("最近の投稿一覧")
      end
    end
    context "いいねランキングページが正しく表示される" do
      before do
        get posts_rank_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("いいねランキング")
      end
    end
    context "投稿詳細ページが正しく表示される" do
      before do
        get shop_post_path(shop, post)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("コメント一覧")
      end
    end
    context "店舗投稿一覧ページが正しく表示される" do
      before do
        get shop_posts_list_path(shop)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("の投稿一覧")
      end
    end
    context "投稿一覧ページへ遷移されない" do
      before do
        get shop_posts_path(shop)
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end
    context "新規投稿ページへ遷移されない" do
      before do
        get new_shop_post_path(shop)
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end
    context "投稿編集ページへ遷移されない" do
      before do
        get edit_shop_post_path(shop, post)
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end
  end
end
 