require 'rails_helper'

describe '投稿のテスト' do
  let(:shop) { create(:shop) }
  let(:shop2) { create(:shop) }
  let(:menu) { create(:menu, shop: shop) }
  let(:menu2) { create(:menu, shop: shop2) }
  before do
  	visit new_shop_session_path
  	fill_in 'shop[email]', with: shop.email
  	fill_in 'shop[password]', with: shop.password
		click_button 'ログイン'
	end
	describe '表示のテスト' do
		context 'メニュー覧画面' do
      it 'メニュ一覧と表示される' do
        visit shop_menus_path(shop)
	    	expect(page).to have_content '＋'
			end
		end
		context '新規登録画面' do
			before do
				visit new_shop_menu_path(shop, menu)
      end
      it 'nameフォームが表示される' do
		  	expect(page).to have_field 'menu[name]'
		  end
			it 'detailフォームが表示される' do
		  	expect(page).to have_field 'menu[detail]'
		  end
			it 'priceフォームが表示される' do
		  	expect(page).to have_field 'menu[price]'
      end
      it 'menu_imageフォームが表示される' do
		  	expect(page).to have_field 'menu[menu_image]'
		  end
			it '新規登録ボタンが表示される' do
		  	expect(page).to have_button '新規登録'
		  end
		end
  end
  describe '編集のテスト' do
  	context '自分の投稿の編集画面への遷移' do
  	  it '遷移できる' do
	  		visit edit_shop_menu_path(shop, menu)
	  		expect(current_path).to eq('/shops/' + shop.id.to_s + '/menus/' + menu.id.to_s + '/edit')
	  	end
	  end
		context '他人の投稿の編集画面への遷移' do
		  it '遷移できない' do
		    visit edit_shop_menu_path(shop, menu2)
		    expect(current_path).to eq('/shops/' + shop.id.to_s + '/menus')
		  end
		end
		context 'フォームの確認' do
			it '編集に成功する' do
				visit edit_shop_menu_path(shop, menu)
				click_button '変更を保存'
				expect(current_path).to eq '/shops/' + shop.id.to_s + '/menus'
			end
			it '登録に成功する' do
				visit new_shop_menu_path(shop, menu)
        fill_in 'menu[name]', with: Faker::Lorem.characters(number:5)
        fill_in 'menu[detail]', with: Faker::Lorem.characters(number:5)
        fill_in 'menu[price]', with: '10'
		  	click_button '新規登録'
		  	expect(page).to have_content '＋'
		  end
		end
	end
end