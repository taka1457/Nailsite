require 'rails_helper'

describe '投稿のテスト' do
  let(:shop) { create(:shop) }
  let(:shop2) { create(:shop) }
  let(:post) { create(:post, shop: shop) }
  let(:post2) { create(:post, shop: shop2) }
  before do
  	visit new_shop_session_path
  	fill_in 'shop[email]', with: shop.email
  	fill_in 'shop[password]', with: shop.password
		click_button 'ログイン'
		visit shop_posts_path(shop, post)
	end
	describe '表示のテスト' do
		context '投稿一覧画面' do
			it '投稿一覧と表示される' do
	    	expect(page).to have_content '＋'
			end
		end
		context '新規投稿画面' do
			before do
				visit new_shop_post_path(shop, post)
			end
			it 'bodyフォームが表示される' do
		  	expect(page).to have_field 'post[body]'
		  end
			it 'post_imageフォームが表示される' do
		  	expect(page).to have_field 'post[post_image]'
		  end
			it '新規投稿ボタンが表示される' do
		  	expect(page).to have_button '新規投稿'
		  end
		end
  end
  describe '編集のテスト' do
  	context '自分の投稿の編集画面への遷移' do
  	  it '遷移できる' do
	  		visit edit_shop_post_path(shop, post)
	  		expect(current_path).to eq('/shops/' + shop.id.to_s + '/posts/' + post.id.to_s + '/edit')
	  	end
	  end
		context '他人の投稿の編集画面への遷移' do
		  it '遷移できない' do
		    visit edit_shop_post_path(shop, post2)
		    expect(current_path).to eq('/shops/' + shop.id.to_s + '/posts')
		  end
		end
		context 'フォームの確認' do
			it '編集に成功する' do
				allow(Vision).to receive(:get_image_data).and_return(["Nail", "Nail polish", "Manicure"])
				visit edit_shop_post_path(shop, post)
				click_button '変更を保存'
				expect(current_path).to eq '/shops/' + shop.id.to_s + '/posts'
			end
			it '投稿に成功する' do
				visit new_shop_post_path(shop, post)
		  	fill_in 'post[body]', with: Faker::Lorem.characters(number:5)
		  	click_button '新規投稿'
		  	expect(page).to have_content '投稿一覧'
		  end
		end
	end
end