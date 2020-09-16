require 'rails_helper'

RSpec.describe "Customers", type: :request do
  let(:customer) { create(:customer) }
  describe '会員ページ（非ログイン）' do
    context "会員一覧ページが正しく表示される" do
      before do
        get customers_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("ポジティブ順")
      end
    end
    context "会員詳細ページが正しく表示される" do
      before do
        get customer_path(customer)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("会員詳細")
      end
    end
    context "会員ポジティブ順ページが正しく表示される" do
      before do
        get customers_rank_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("ポジティブ順")
      end
    end
  end
  describe '会員ページ（ログイン済み）' do
    before do
      sign_in customer
    end
    context "マイページが正しく表示される" do
      it 'リクエストは200 OKとなること' do
        get mypage_path
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        get mypage_path
        expect(response.body).to include("マイページ")
      end
    end
    context "編集ページが正しく表示される" do
      it 'リクエストは200 OKとなること' do
        get edit_information_path
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        get edit_information_path
        expect(response.body).to include("会員情報編集")
      end
    end
    context "編集ページが正しく表示される" do
      it 'リクエストは302 OKとなること' do
        put customers_information_path
        expect(response.status).to eq 302
      end

    end
  end
end
 