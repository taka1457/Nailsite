require 'rails_helper'

RSpec.describe "Public_Relationships", type: :request do
  let(:customer) { create(:customer) }
  describe '会員ログイン済み' do
    before do
      sign_in customer
      get follow_path
    end
    context "followページが正しく表示される" do
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("follow")
      end
    end
  end
  describe '会員非ログイン' do
    before do
      get follow_path
    end
    context "ログインページへ遷移される" do
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end
  end
end
 