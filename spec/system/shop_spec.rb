require 'rails_helper'

describe 'Shopマイページのテスト' do
  let(:shop) { create(:shop) }
  before do
    visit new_shop_session_path
    fill_in 'shop[email]', with: shop.email
    fill_in 'shop[password]', with: shop.password
    click_button 'ログイン'
  end
  context 'リンクボタンを確認' do
    subject { page }
    it '編集リンクが表示される' do
      edit_link = find_all('a')[8].native.inner_text
      is_expected.to have_content '編集する'
    end
    it 'パスワード変更リンクが表示される' do
      password_link = find_all('a')[9].native.inner_text
      is_expected.to have_content 'パスワードを変更する'
    end
    it '店舗一覧リンクが表示される' do
      customers_link = find_all('a')[10].native.inner_text
      is_expected.to have_content '店舗一覧'
    end
    it '投稿一覧リンクが表示される' do
      shops_link = find_all('a')[11].native.inner_text
      is_expected.to have_content '投稿一覧'
    end
  end
  context 'マイページのリンク遷移先を確認' do
    it 'パスワード変更画面に遷移する' do
      click_link "パスワードを変更する", match: :first
      expect(page).to have_content("パスワード再設定")
    end
    it '店舗一覧画面に遷移する' do
      click_link "店舗一覧", match: :first
      expect(page).to have_content("サロン一覧")
    end
    it '投稿一覧画面に遷移する' do
      click_link "最新投稿", match: :first
      expect(page).to have_content("いいね順")
    end
  end
end

describe 'Shop検索のテスト' do
  context 'トップページでの検索を確認' do
    before do
      visit root_path
    end
    subject { page }
    it '地名検索の検索結果が表示される' do
      fill_in 'search[content]', with: '東京'
      click_button '検索'
      expect(page).to have_content("検索ワード：東京")
    end
    it '店名検索の検索結果が表示される' do
      fill_in 'search[content]', with: 'nailsalon'
      click_button '検索'
      expect(page).to have_content("検索ワード：nailsalon")
    end
  end
  context '店舗一覧画面での検索を確認' do
    before do
      visit shops_path
    end
    it '地名検索の検索結果が表示される' do
      fill_in 'search[content]', with: '東京'
      click_button '検索'
      expect(page).to have_content("検索ワード：東京")
    end
    it '店名検索の検索結果が表示される' do
      fill_in 'search[content]', with: 'nailsalon'
      click_button '検索'
      expect(page).to have_content("検索ワード：nailsalon")
    end
  end
end
