require 'rails_helper'

RSpec.describe "Public_Talks", type: :request do
  let(:customer) { create(:customer) }
  describe '会員ログイン済み' do
    before do
      sign_in customer
    end
    context "Contactページが正しく表示される" do
      before do
        get customers_talk_path(customer, customer)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("Contact")
      end
    end
    context "受信一覧ページが正しく表示される" do
      before do
        get customers_talks_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("受信一覧")
      end
    end
  end
  describe '会員非ログイン' do
    before do
      get customers_talk_path(customer, customer)
    end
    context "ログインページへ遷移される" do
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end
  end
end