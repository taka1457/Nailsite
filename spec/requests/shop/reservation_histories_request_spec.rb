require 'rails_helper'

RSpec.describe "Shop_ReservationHistories", type: :request do
  let(:shop) { create(:shop) }
  let(:menu) { create(:menu) }
  describe '店舗ログイン済み' do
    before do
      sign_in shop
    end
    context "予約履歴一覧ページが正しく表示される" do
      before do
        get shops_histories_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("予約履歴一覧")
      end
    end
  end
  describe '会員非ログイン' do
    context "店舗レビューページが正しく表示される" do
      before do
        get shop_review_path(shop)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("のレビュー")
      end
    end
  end
end
 