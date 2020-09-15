require 'rails_helper'

RSpec.describe 'Menuモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:menu) { build(:menu) }
    subject { test_menu.valid? }
    let(:test_menu) { menu }
    context 'nameカラム' do
      it '空欄でないこと' do
        test_menu.name = ''
        is_expected.to eq false;
      end
      it '36文字以下であること' do
        test_menu.name = Faker::Lorem.characters(number:37)
        is_expected.to eq false;
      end
    end
    context 'detailカラム' do
      it '空欄でないこと' do
        test_menu.detail = ''
        is_expected.to eq false;
      end
      it '50文字以下であること' do
        test_menu.detail = Faker::Lorem.characters(number:51)
        is_expected.to eq false;
      end
    end
    context 'priceカラム' do
      it '空欄でないこと' do
        test_menu.price = ''
        is_expected.to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'ReservationMenuモデルとの関係' do
      it '1:Nとなっている' do
        expect(Menu.reflect_on_association(:reservation_menus).macro).to eq :has_many
      end
    end
    context 'ReservationHistoryモデルとの関係' do
      it '1:Nとなっている' do
        expect(Menu.reflect_on_association(:reservation_histories).macro).to eq :has_many
      end
    end
    context 'Shopモデルとの関係' do
      it 'N:1となっている' do
        expect(Menu.reflect_on_association(:shop).macro).to eq :belongs_to
      end
    end
  end
end