require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
    describe 'バリデーションのテスト' do
      let(:shop) { FactoryBot.create(:shop) }
      let!(:post) { build(:post, shop_id: shop.id) }
  
      context 'bodyカラム' do
        it '140文字以下であること' do
          post.body = Faker::Lorem.characters(number:141)
          expect(post.valid?).to eq false;
        end
      end
      context 'bodyカラム' do
        it '141文字以上だとvalidationエラーを表示' do
          post.body = Faker::Lorem.characters(number:141)
          expect(post.valid?).to eq false;
        end
      end
    end
    describe 'アソシエーションのテスト' do
      context 'Shopモデルとの関係' do
        it 'N:1となっている' do
          expect(Post.reflect_on_association(:shop).macro).to eq :belongs_to
        end
      end
    end
  end