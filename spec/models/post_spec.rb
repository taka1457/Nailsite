require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗
  describe 'バリデーションのテスト' do
    let(:shop) { FactoryBot.create(:shop) }
    let!(:post) { build(:post, shop_id: shop.id) }
    context 'bodyカラム' do
      it '140文字以下であること' do
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
    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
    context 'Tagモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:tags).macro).to eq :has_many
      end
    end
  end
end