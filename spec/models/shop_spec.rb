require 'rails_helper'

RSpec.describe 'Shopモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:shop) { build(:shop) }
    subject { test_shop.valid? }
    context 'nameカラム' do
      let(:test_shop) { shop }
      it '空欄でないこと' do
        test_shop.name = ''
        is_expected.to eq false;
      end
      it '40文字以下であること' do
        test_shop.name = Faker::Lorem.characters(number:40)
        is_expected.to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    let(:genre) { FactoryBot.create(:genre) }
    context 'Genreモデルとの関係' do
			it '1:Nとなっている' do
				expect(Genre.reflect_on_association(:shops).macro).to eq :has_many
			end
    end
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(Shop.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
    context 'Menuモデルとの関係' do
      it '1:Nとなっている' do
        expect(Shop.reflect_on_association(:menus).macro).to eq :has_many
      end
    end
    context 'ShopRoomモデルとの関係' do
      it '1:Nとなっている' do
        expect(Shop.reflect_on_association(:shop_rooms).macro).to eq :has_many
      end
    end
    context 'Talkモデルとの関係' do
      it '1:Nとなっている' do
        expect(Shop.reflect_on_association(:talks).macro).to eq :has_many
      end
    end
    context 'TalkRoomモデルとの関係' do
      it '1:Nとなっている' do
        expect(Shop.reflect_on_association(:talk_rooms).macro).to eq :has_many
      end
    end
    context 'Bookmarkモデルとの関係' do
      it '1:Nとなっている' do
        expect(Shop.reflect_on_association(:bookmarks).macro).to eq :has_many
      end
    end

  end
end