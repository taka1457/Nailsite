require 'rails_helper'

describe 'トークルームのテスト' do
  let(:shop) { create(:shop) }
  let(:customer) { create(:customer) }
  let(:customer2) { create(:customer) }
  before do
  	visit new_customer_session_path
  	fill_in 'customer[email]', with: customer.email
  	fill_in 'customer[password]', with: customer.password
		click_button 'ログイン'
		visit customers_talk_path(customer2, customer2)
	end
	describe '表示のテスト' do
		context '会員同士のトークルーム画面' do
      it '送信ボタンが表示される' do
		  	expect(page).to have_button '送信'
      end
      it 'bodyフォームが表示される' do
		  	expect(page).to have_field 'talk[body]'
		  end
    end
  end
end