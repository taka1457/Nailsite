require 'rails_helper'

describe 'Customerマイページのテスト' do
  let(:customer) { create(:customer) }
  before do
    visit new_customer_session_path
    fill_in 'customer[email]', with: customer.email
    fill_in 'customer[password]', with: customer.password
    click_button 'ログイン'
  end
  context 'リンクボタンを確認' do
    subject { page }
    it '編集リンクが表示される' do
      edit_link = find_all('a')[6].native.inner_text
      is_expected.to have_content '編集する'
    end
    it 'パスワード変更リンクが表示される' do
      password_link = find_all('a')[7].native.inner_text
      is_expected.to have_content 'パスワードを変更する'
    end
    it 'お気に入りユーザーリンクが表示される' do
      customers_link = find_all('a')[8].native.inner_text
      is_expected.to have_content 'お気に入りユーザー'
    end
    it 'お気に入りサロンリンクが表示される' do
      shops_link = find_all('a')[9].native.inner_text
      is_expected.to have_content 'お気に入りサロン'
    end
    it '予約一覧リンクが表示される' do
      reserves_link = find_all('a')[10].native.inner_text
      is_expected.to have_content '予約一覧'
    end
    it '連絡一覧リンクが表示される' do
      contacts_link = find_all('a')[11].native.inner_text
      is_expected.to have_content '連絡一覧'
    end
    it '写真検索リンクが表示される' do
      photos_link = find_all('a')[12].native.inner_text
      is_expected.to have_content '写真検索'
    end
  end
  context 'リンク遷移先を確認' do
    it '編集画面に遷移する' do
      click_link "編集する", match: :first
      expect(page).to have_content("会員情報編集")
    end
    it 'パスワード変更画面に遷移する' do
      click_link "パスワードを変更する", match: :first
      expect(page).to have_content("パスワード再設定")
    end
    it 'お気に入りユーザー画面に遷移する' do
      click_link "お気に入りユーザー", match: :first
      expect(page).to have_content("Followユーザー")
    end
    it 'お気に入りサロン画面に遷移する' do
      click_link "お気に入りサロン", match: :first
      expect(page).to have_content("お気に入りサロン一覧")
    end
    it '予約一覧画面に遷移する' do
      click_link "予約一覧", match: :first
      expect(page).to have_content("予約履歴一覧")
    end
    it '連絡一覧画面に遷移する' do
      click_link "連絡一覧", match: :first
      expect(page).to have_content("最近の受信一覧")
    end
    it '写真検索画面に遷移する' do
      click_link "写真検索", match: :first
      expect(page).to have_content("類似画像")
    end
  end
end

