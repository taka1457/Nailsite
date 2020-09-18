require 'rails_helper'

RSpec.describe "Shop_Talks", type: :request do
  let(:shop) { create(:shop) }
  let(:customer) { create(:customer) }
  describe '店舗ログイン済み' do
    before do
      sign_in shop
    end
    context "連絡一覧ページが正しく表示される" do
      before do
        get shops_talks_path(shop)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("受信一覧")
      end
    end
  end
  describe '店舗非ログイン' do
    context "連絡一覧ページへ遷移されない" do
      before do
        get shops_talks_path
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end
    context "コンタクトページへ遷移されない" do
      before do
        get shops_talk_path(customer, shop, customer)
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end
  end
end
 