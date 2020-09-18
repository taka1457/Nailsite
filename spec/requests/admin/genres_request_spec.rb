require 'rails_helper'

RSpec.describe "Admin_genres", type: :request do
  let(:admin) { create(:admin) }
  let(:genre) { create(:genre) }
  describe '管理者ログイン済み' do
    before do
      sign_in admin
    end
    context "ジャンル一覧ページが正しく表示される" do
      before do
        get genres_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("ジャンル一覧・追加")
      end
    end
    context "ジャンル編集ページが正しく表示される" do
      before do
        get edit_genre_path(genre)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("ジャンル編集")
      end
    end
  end
  describe '管理者非ログイン' do
    context "ジャンル一覧ページへ遷移されない" do
      before do
        get genres_path
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end
    context "ジャンル編集ページへ遷移されない" do
      before do
        get edit_genre_path(genre)
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end
  end
end
 