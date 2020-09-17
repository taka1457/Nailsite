require 'rails_helper'

RSpec.describe "Homes", type: :request do
  context "トップページが正しく表示される" do
    before do
      get root_path
    end
    it 'リクエストは200 OKとなること' do
      expect(response.status).to eq 200
    end
    it 'タイトルが正しく表示されていること' do
      expect(response.body).to include("Nailsiteへ、ようこそ")
    end
  end
  context "使い方ページが正しく表示される" do
    before do
      get about_path
    end
    it 'リクエストは200 OKとなること' do
      expect(response.status).to eq 200
    end
    it 'タイトルが正しく表示されていること' do
      expect(response.body).to include("特徴と使い方")
    end
  end
end
 