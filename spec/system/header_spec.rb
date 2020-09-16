require 'rails_helper'

describe 'ヘッダーのテスト' do
  describe 'ログインしていない場合' do
    before do
      visit root_path
    end
    context 'ヘッダーの表示を確認' do
      subject { page }
      it 'タイトルが表示される' do
        is_expected.to have_content 'Nailsite'
      end
      it '使い方リンクが表示される' do
        about_link = find_all('a')[0].native.inner_text
        is_expected.to have_content '使い方'
      end
      it '店舗一覧リンクが表示される' do
        shops_link = find_all('a')[1].native.inner_text
        is_expected.to have_content '店舗一覧'
      end
      it '投稿一覧リンクが表示される' do
        posts_link = find_all('a')[2].native.inner_text
        is_expected.to have_content '投稿一覧'
      end
      it '会員一覧リンクが表示される' do
        customers_link = find_all('a')[3].native.inner_text
        is_expected.to have_content '会員一覧'
      end
      it '新規登録リンクが表示される' do
        signup_link = find_all('a')[4].native.inner_text
        is_expected.to have_content '新規登録'
      end
      it 'ログインリンクが表示される' do
        login_link = find_all('a')[5].native.inner_text
        is_expected.to have_content 'ログイン'
      end
    end
    context 'ヘッダーのリンクを確認' do
      it '使い方画面に遷移する' do
        click_link "使い方", match: :first
        expect(page).to have_content("特徴と使い方")
      end
      it '店舗一覧画面に遷移する' do
        click_link "店舗一覧", match: :first
        expect(page).to have_content("サロン一覧")
      end
      it '投稿一覧画面に遷移する' do
        click_link "投稿一覧", match: :first
        expect(page).to have_content("最近の投稿")
      end
      it '会員一覧画面に遷移する' do
        click_link "会員一覧", match: :first
        expect(page).to have_content("ポジティブ")
      end
      it '新規登録画面に遷移する' do
        click_link "新規登録", match: :first
        expect(page).to have_content("既に登録済みの方")
      end
      it 'ログイン画面に遷移する' do
        click_link "ログイン", match: :first
        expect(page).to have_content("登録がお済みでない方")
      end
    end
  end

  describe '会員がログインしている場合' do
    let(:customer) { create(:customer) }
    before do
      visit new_customer_session_path
      fill_in 'customer[email]', with: customer.email
      fill_in 'customer[password]', with: customer.password
      click_button 'ログイン'
    end
    context 'ヘッダーの表示を確認' do
      subject { page }
      it 'タイトルが表示される' do
        is_expected.to have_content 'Nailsite'
      end
      it 'マイページリンクが表示される' do
        mypage_link = find_all('a')[0].native.inner_text
        is_expected.to have_content 'マイページ'
      end
      it '店舗一覧リンクが表示される' do
        shops_link = find_all('a')[1].native.inner_text
        is_expected.to have_content '店舗一覧'
      end
      it '投稿一覧リンクが表示される' do
        posts_link = find_all('a')[2].native.inner_text
        is_expected.to have_content '投稿一覧'
      end
      it '会員一覧リンクが表示される' do
        customers_link = find_all('a')[3].native.inner_text
        is_expected.to have_content '会員一覧'
      end
      it 'ログアウトリンクが表示される' do
        logout_link = find_all('a')[4].native.inner_text
        is_expected.to have_content 'ログアウト'
      end
    end
    context 'ヘッダーのリンクを確認' do
      it 'マイページ画面に遷移する' do
        click_link "マイページ", match: :first
        expect(page).to have_content("登録情報")
      end
      it '店舗一覧画面に遷移する' do
        click_link "店舗一覧", match: :first
        expect(page).to have_content("サロン一覧")
      end
      it '投稿一覧画面に遷移する' do
        click_link "投稿一覧", match: :first
        expect(page).to have_content("最近の投稿")
      end
      it '会員一覧画面に遷移する' do
        click_link "会員一覧", match: :first
        expect(page).to have_content("ポジティブ")
      end
      it 'ログアウト画面に遷移する' do
        click_link "ログアウト", match: :first
        expect(page).to have_content("Nailsiteへ、ようこそ")
      end
    end
  end

  describe '店舗がログインしている場合' do
    let(:shop) { create(:shop) }
    before do
      visit new_shop_session_path
      fill_in 'shop[email]', with: shop.email
      fill_in 'shop[password]', with: shop.password
      click_button 'ログイン'
    end
    context 'ヘッダーの表示を確認' do
      subject { page }
      it 'タイトルが表示される' do
        is_expected.to have_content 'Nailsite'
      end
      it 'マイページリンクが表示される' do
        mypage_link = find_all('a')[0].native.inner_text
        is_expected.to have_content 'マイページ'
      end
      it '予約一覧リンクが表示される' do
        reservation_histories_link = find_all('a')[1].native.inner_text
        is_expected.to have_content '予約一覧'
      end
      it '連絡一覧リンクが表示される' do
        talks_link = find_all('a')[2].native.inner_text
        is_expected.to have_content '連絡一覧'
      end
      it 'メニューリンクが表示される' do
        menus_link = find_all('a')[3].native.inner_text
        is_expected.to have_content 'メニュー'
      end
      it '投稿一覧リンクが表示される' do
        posts_link = find_all('a')[3].native.inner_text
        is_expected.to have_content '投稿一覧'
      end
      it '会員一覧リンクが表示される' do
        customers_link = find_all('a')[3].native.inner_text
        is_expected.to have_content '会員一覧'
      end
      it 'ログアウトリンクが表示される' do
        logout_link = find_all('a')[4].native.inner_text
        is_expected.to have_content 'ログアウト'
      end
    end
    context 'ヘッダーのリンクを確認' do
      it 'マイページ画面に遷移する' do
        click_link "マイページ", match: :first
        expect(page).to have_content("登録情報")
      end
      it '予約一覧画面に遷移する' do
        click_link "予約一覧", match: :first
        expect(page).to have_content("予約履歴")
      end
      it '連絡一覧画面に遷移する' do
        click_link "連絡一覧", match: :first
        expect(page).to have_content("受信一覧")
      end
      it 'メニュ一覧画面に遷移する' do
        click_link "メニュー", match: :first
        expect(page).to have_content("メニュー画像")
      end
      it '投稿一覧画面に遷移する' do
        click_link "投稿一覧", match: :first
        expect(page).to have_content("＋")
      end
      it '会員一覧画面に遷移する' do
        click_link "会員一覧", match: :first
        expect(page).to have_content("ポジティブ順")
      end
      it 'ログアウト画面に遷移する' do
        click_link "ログアウト", match: :first
        expect(page).to have_content("店舗様会員の方はこちらからログイン")
      end
    end
  end
end
