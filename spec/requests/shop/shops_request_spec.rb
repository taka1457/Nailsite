require 'rails_helper'

RSpec.describe "Shops", type: :request do
  let(:shop) { create(:shop) }
  let(:genre) { create(:genre) }
  describe '店舗ページ（非ログイン）' do
    context "店舗一覧ページが正しく表示される" do
      before do
        get shops_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("マップ表示")
      end
    end
    context "店舗詳細ページが正しく表示される" do
      before do
        get shops_map_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("リスト表示")
      end
    end
    context "店舗詳細ページが正しく表示される" do
      before do
        get shops_search_path(genre)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("マップ表示")
      end
    end
    context "店舗詳細ページが正しく表示される" do
      before do
        get shops_map_search_path(genre)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("リスト表示")
      end
    end
    context "店舗詳細ページが正しく表示される" do
      before do
        get shop_path(shop)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("レビューを見る")
      end
    end
    context "店舗メニューページが正しく表示される" do
      before do
        get shop_menu_list_path(shop)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("のメニュー")
      end
    end
    context "マイページへ遷移されない" do
      before do
        get shop_mypage_path
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end
    context "退会ページへ遷移されない" do
      before do
        get confirm_shop_unsubscribe_path
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end
  end
  describe '会員ページ（ログイン済み）' do
    before do
      sign_in shop
    end
    context "マイページが正しく表示される" do
      before do
        get shop_mypage_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("マイページ")
      end
    end
    context "退会ページが正しく表示される" do
      before do
        get confirm_shop_unsubscribe_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("本当に退会しますか？")
      end
    end
  end
end
 