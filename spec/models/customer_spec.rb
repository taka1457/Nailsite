require 'rails_helper'

RSpec.describe 'Customerモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:customer) { build(:customer) }
    subject { test_customer.valid? }
    let(:test_customer) { customer }
    context 'first_nameカラム' do
      it '空欄でないこと' do
        test_customer.first_name = ''
        is_expected.to eq false;
      end
    end
    context 'last_nameカラム' do
      it '空欄でないこと' do
        test_customer.last_name = ''
        is_expected.to eq false;
      end
    end
    context 'first_name_kanaカラム' do
      it '空欄でないこと' do
        test_customer.first_name_kana = ''
        is_expected.to eq false;
      end
      it "フリガナのフォーマットが正しくない場合、ユーザー登録に失敗すること" do
        customer.first_name_kana = "てすと"
        customer.valid?
        expect(customer.errors.full_messages).to include "名前（セイ）は不正な値です"
      end
    end
    context 'last_name_kanaカラム' do
      it '空欄でないこと' do
        test_customer.last_name_kana = ''
        is_expected.to eq false;
      end
      it "フリガナのフォーマットが正しくない場合、ユーザー登録に失敗すること" do
        customer.last_name_kana = "てすと"
        customer.valid?
        expect(customer.errors.full_messages).to include "名前（メイ）は不正な値です"
      end
    end
    context 'emailカラム' do
      it '空欄でないこと' do
        test_customer.email = ''
        is_expected.to eq false;
      end
      it "メールアドレスのフォーマットが正しくない場合、ユーザー登録に失敗すること" do
        customer.email = "exampletestcom"
        customer.valid?
        expect(customer.errors.full_messages).to include "メールアドレスは不正な値です"
      end
    end
    context 'phone_numberカラム' do
      it '空欄でないこと' do
        test_customer.phone_number = ''
        is_expected.to eq false;
      end
      it "電話番号のフォーマットが正しくない場合、ユーザー登録に失敗すること" do
        customer.phone_number = "11"
        customer.valid?
        expect(customer.errors.full_messages).to include "電話番号は不正な値です"
      end
    end
    context 'introductionカラム' do
      it '150文字以下であること' do
        test_customer.introduction = Faker::Lorem.characters(number:151)
        is_expected.to eq false;
      end
    end
    
  end
  describe 'アソシエーションのテスト' do
    context 'ImgSearchモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:img_searchs).macro).to eq :has_many
      end
    end
    context 'ReservationMenuモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:reservation_menus).macro).to eq :has_many
      end
    end
    context 'Reserveモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:reserves).macro).to eq :has_many
      end
    end
    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
    context 'HistoryCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:history_comments).macro).to eq :has_many
      end
    end
    context 'CustomerRoomモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:customer_rooms).macro).to eq :has_many
      end
    end
    context 'Talkモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:talks).macro).to eq :has_many
      end
    end
    context 'TalkRoomsモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:talk_rooms).macro).to eq :has_many
      end
    end
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
    context 'Bookmarkモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:bookmarks).macro).to eq :has_many
      end
    end

  end
end