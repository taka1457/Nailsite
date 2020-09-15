require 'rails_helper'

RSpec.describe 'Shopモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:shop) { build(:shop) }
    subject { test_shop.valid? }
    let(:test_shop) { shop }
    context 'nameカラム' do
      it '空欄でないこと' do
        test_shop.name = ''
        is_expected.to eq false;
      end
      it '40文字以下であること' do
        test_shop.name = Faker::Lorem.characters(number:40)
        is_expected.to eq false;
      end
    end
    context 'emailカラム' do
      it '空欄でないこと' do
        test_shop.name = ''
        is_expected.to eq false;
      end
      it "メールアドレスのフォーマットが正しくない場合、ユーザー登録に失敗すること" do
        shop.email = "exampletestcom"
        shop.valid?
        expect(shop.errors.full_messages).to include "メールアドレスは不正な値です"
      end
    end
    context 'postal_codeカラム' do
      it '空欄でないこと' do
        test_shop.postal_code = ''
        is_expected.to eq false;
      end
      it "郵便番号のフォーマットが正しくない場合、登録に失敗すること" do
        shop.postal_code = "11"
        shop.valid?
        expect(shop.errors.full_messages).to include "郵便番号は不正な値です"
      end
    end
    context 'prefecture_codeカラム' do
      it '空欄でないこと' do
        test_shop.prefecture_code = ''
        is_expected.to eq false;
      end
    end
    context 'cityカラム' do
      it '空欄でないこと' do
        test_shop.city = ''
        is_expected.to eq false;
      end
    end
    context 'streetカラム' do
      it '空欄でないこと' do
        test_shop.street = ''
        is_expected.to eq false;
      end
    end
    context 'other_addressカラム' do
      it '40文字以下であること' do
        test_shop.other_address = Faker::Lorem.characters(number:40)
        is_expected.to eq false;
      end
    end
    context 'phone_numberカラム' do
      it '空欄でないこと' do
        test_shop.phone_number = ''
        is_expected.to eq false;
      end
      it "電話番号のフォーマットが正しくない場合、ユーザー登録に失敗すること" do
        shop.phone_number = "11"
        shop.valid?
        expect(shop.errors.full_messages).to include "電話番号は不正な値です"
      end
    end
    context 'budgetカラム' do
      it '空欄でないこと' do
        test_shop.budget = ''
        is_expected.to eq false;
      end
    end
    context 'seatカラム' do
      it '空欄でないこと' do
        test_shop.seat = ''
        is_expected.to eq false;
      end
    end
    context 'staffカラム' do
      it '空欄でないこと' do
        test_shop.staff = ''
        is_expected.to eq false;
      end
    end
    context 'traffic_methodカラム' do
      it '空欄でないこと' do
        test_shop.traffic_method = ''
        is_expected.to eq false;
      end
      it '40文字以下であること' do
        test_shop.traffic_method = Faker::Lorem.characters(number:201)
        is_expected.to eq false;
      end
    end
    context 'payment_methodカラム' do
      it '空欄でないこと' do
        test_shop.payment_method = ''
        is_expected.to eq false;
      end
      it '40文字以下であること' do
        test_shop.payment_method = Faker::Lorem.characters(number:101)
        is_expected.to eq false;
      end
    end
    context 'business_hoursカラム' do
      it '空欄でないこと' do
        test_shop.business_hours = ''
        is_expected.to eq false;
      end
      it '40文字以下であること' do
        test_shop.business_hours = Faker::Lorem.characters(number:101)
        is_expected.to eq false;
      end
    end
    context 'parkingカラム' do
      it '空欄でないこと' do
        test_shop.parking = ''
        is_expected.to eq false;
      end
      it '40文字以下であること' do
        test_shop.parking = Faker::Lorem.characters(number:20)
        is_expected.to eq false;
      end
    end
    context 'promotionカラム' do
      let(:test_shop) { shop }
      it '空欄でないこと' do
        test_shop.promotion = ''
        is_expected.to eq false;
      end
      it '50文字以下であること' do
        test_shop.promotion = Faker::Lorem.characters(number:51)
        is_expected.to eq false;
      end
    end
    context 'introductionカラム' do
      let(:test_shop) { shop }
      it '空欄でないこと' do
        test_shop.introduction = ''
        is_expected.to eq false;
      end
      it '50文字以下であること' do
        test_shop.introduction = Faker::Lorem.characters(number:151)
        is_expected.to eq false;
      end
    end
    context 'genre_idカラム' do
      let(:test_shop) { shop }
      it '空欄でないこと' do
        test_shop.genre_id = ''
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