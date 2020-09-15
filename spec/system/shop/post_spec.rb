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
			it '編集に失敗する' do
				allow(Vision).to receive(:get_image_data).and_return(["Nail", "Nail polish", "Manicure"])
				visit edit_shop_post_path(shop, post)
				fill_in 'post[body]', with: ''
				click_button '変更を保存'
				expect(current_path).to eq '/shops/' + shop.id.to_s + '/posts'
			end
		end
	end
end