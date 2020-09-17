require 'rails_helper'

RSpec.describe "Shop_menus", type: :request do
  let(:shop) { create(:shop) }
  let(:menu) { create(:menu) }
  describe '店舗ログイン済み' do
    before do
      sign_in shop
    end
    context "メニュ一覧ページが正しく表示される" do
      before do
        get shop_menus_path(shop)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("メニュー画像")
      end
    end
    context "メニュ一登録ページが正しく表示される" do
      before do
        get new_shop_menu_path(shop)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("メニュー登録")
      end
    end
  end
  describe '会員非ログイン' do
    context "メニュ一覧ページへ遷移されない" do
      before do
        get shop_menus_path(shop)
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end
    context "メニュ一登録ページが正しく表示される" do
      before do
        get new_shop_menu_path(shop)
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end
  end
end
 