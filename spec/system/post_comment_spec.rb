require 'rails_helper'

describe '投稿のコメントテスト' do
  let(:shop) { create(:shop) }
  let(:post) { create(:post) }
  let(:customer) { create(:customer) }
  before do
  	visit new_customer_session_path
  	fill_in 'customer[email]', with: customer.email
  	fill_in 'customer[password]', with: customer.password
		click_button 'ログイン'
		visit shop_post_path(shop, post)
	end
	describe '表示のテスト' do
		context 'コメント一覧画面' do
			it 'コメント一覧と表示される' do
	    	expect(page).to have_content 'コメント一覧'
      end
      it '送信ボタンが表示される' do
		  	expect(page).to have_button '送信'
      end
      it 'bodyフォームが表示される' do
		  	expect(page).to have_field 'post_comment[body]'
		  end
		end
  end
end